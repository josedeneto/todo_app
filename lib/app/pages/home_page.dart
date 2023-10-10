import 'package:app_todo/app/constants/app_constants.dart';
import 'package:app_todo/app/utils/colors/app_color.dart';
import 'package:app_todo/app/utils/style/app_typography.dart';
import 'package:app_todo/app/utils/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> todos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        implyLeading: false,
        title: Text(
          'Olá',
          style: AppTypography.boldText!.copyWith(fontSize: 24),
        ),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.menu))],
        
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'José',
                      style: AppTypography.normal!.copyWith(fontSize: 18)),
                  TextSpan(
                      text: '  Neto',
                      style: AppTypography.boldText!.copyWith(fontSize: 18)),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TodoStatus(todos: todos),
                Text.rich(
                  TextSpan(children: [
                    const TextSpan(text: '0 '),
                    const TextSpan(text: 'Tarefas '),
                    TextSpan(
                      text: 'Coompletas',
                      style: AppTypography.boldText,
                    )
                  ]),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Lista de tarefas',
              style:
                  AppTypography.normal!.copyWith(color: AppColor.secondary),
            ),
            const SizedBox(
              height: 15,
            ),
            todos.isEmpty
                ? Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/3.png',
                            height: 150,
                          ),
                          Text(
                            AppConstants.messageNoTodo,
                            textAlign: TextAlign.center,
                            style: AppTypography.normal,
                          ),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.separated(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      separatorBuilder: (_, i) => const Divider(),
                      itemCount: todos.length,
                      itemBuilder: (_, index) => ListTile(
                        leading: Text(
                          '${index + 1} -',
                        ),
                        title: Text(
                          todos[index],
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Adicionar',
        onPressed: () async {
          final response = await Navigator.pushNamed(context, '/add_todo');
          if (response != null) {
            setState(() {
              todos.add(response.toString());
            });
          } else {
            todos.add("");
          }
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}


