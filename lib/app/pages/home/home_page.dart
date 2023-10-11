// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_todo/app/pages/home/components/filter_chip_component.dart';
import 'package:flutter/material.dart';

import 'package:app_todo/app/constants/app_constants.dart';
import 'package:app_todo/app/utils/colors/app_color.dart';
import 'package:app_todo/app/utils/helpers/navigators_extension.dart';
import 'package:app_todo/app/utils/style/app_typography.dart';
import 'package:app_todo/app/utils/widgets/app_bar_widget.dart';

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
          style: AppTypography.boldText!.copyWith(
            fontSize: 24,
          ),
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
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 20,
        ),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FilterChipComponent(
                  title: 'Todas',
                  todos: todos,
                  function: null,
                  isSelected: true,
                ),
                const SizedBox(
                  width: 15,
                ),
                FilterChipComponent(
                  title: 'A fazer',
                  todos: todos,
                  function: null,
                  isSelected: false,
                ),
                const SizedBox(
                  width: 15,
                ),
                FilterChipComponent(
                  title: 'Feitas',
                  todos: todos,
                  function: null,
                  isSelected: false,
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Text('Minhas tarefas',
                style: AppTypography.boldText!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                )),
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
                            style: AppTypography.normal!.copyWith(
                              color: AppColor.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.separated(
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
      floatingActionButton: FloatingActionButton.extended(
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
        label: const Text(
          'Adicionar',
        ),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
