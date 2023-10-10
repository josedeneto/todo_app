import 'package:app_todo/app/constants/app_constants.dart';
import 'package:app_todo/app/utils/colors/app_color.dart';
import 'package:app_todo/app/utils/helpers/navigators_extension.dart';
import 'package:app_todo/app/utils/style/app_typography.dart';
import 'package:app_todo/app/utils/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'components/todo_status.dart';

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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
            ),
          ),
        ],
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
                    style: AppTypography.normal!.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: '  Neto',
                    style: AppTypography.boldText!.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColor.chips,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(child:  Text('Todas(23)')),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.hint, width: 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(child: Text('A fazer(2)')),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.hint, width: 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(child: Text('Feitas(0)')),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Lista de tarefas',
              style: AppTypography.boldText!.copyWith(fontSize: 18, fontWeight: FontWeight.w400,)
            ),
            const SizedBox(
              height: 20,
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
                            style: AppTypography.normal!
                                .copyWith(color: AppColor.grey),
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
          final response = await context.pushNamed(page: '/add_todo');
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
