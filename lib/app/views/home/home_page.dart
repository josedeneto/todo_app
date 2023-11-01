import 'package:app_todo/app/utils/helpers/extensions/navigators_extension.dart';
import 'package:app_todo/app/views/home/controller/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:app_todo/app/utils/constants/app_constants.dart';
import 'package:app_todo/app/utils/colors/app_color.dart';
import 'package:app_todo/app/utils/style/app_typography.dart';
import 'package:app_todo/app/utils/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';

import 'widgets/filter_chip_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              Icons.more_vert_outlined,
              color: AppColor.white,
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
                    text: ' Neto',
                    style: AppTypography.boldText,
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
                  todos: context.read<HomeController>().todos,
                  function: null,
                  isSelected: true,
                ),
                const SizedBox(
                  width: 15,
                ),
                FilterChipComponent(
                  title: 'Feitas',
                  todos: context.read<HomeController>().done,
                  function: null,
                  isSelected: false,
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Minhas tarefas',
              style: AppTypography.boldText!.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            context.watch<HomeController>().todos.isEmpty
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
                      physics: const BouncingScrollPhysics(
                        decelerationRate: ScrollDecelerationRate.fast,
                      ),
                      separatorBuilder: (_, i) => const Divider(),
                      itemCount: context.read<HomeController>().todos.length,
                      itemBuilder: (_, t) {
                        return Consumer<HomeController>(
                            builder: (_, todo, child) {
                          return Dismissible(
                            direction: DismissDirection.horizontal,
                            onDismissed: (_) {
                              todo.removeTodo(todo.todos[t]);
                            },
                            key: Key(
                              t.toString(),
                            ),
                            child: ListTile(
                              selected: todo.done.contains(
                                todo.todos[t],
                              ),
                              onTap: () {
                                todo.doneTodo(
                                  todo.todos[t],
                                );
                              },
                              leading: Text(
                                '${t + 1} -',
                              ),
                              title: Text(
                                todo.todos[t].title,
                              ),
                              subtitle: Text(
                                todo.todos[t].dataTime,
                              ),
                            ),
                          );
                        });
                      },
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.pushNamed('/add_todo');
        },
        label: const Text(
          'Adicionar',
        ),
        icon: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
