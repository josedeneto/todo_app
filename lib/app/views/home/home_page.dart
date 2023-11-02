import 'package:app_todo/app/utils/helpers/extensions/navigators_extension.dart';
import 'package:app_todo/app/utils/helpers/mixins/alert_dialog.dart';
import 'package:app_todo/app/utils/helpers/mixins/greeting.dart';
import 'package:app_todo/app/views/home/controller/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:app_todo/app/utils/constants/app_constants.dart';
import 'package:app_todo/app/utils/colors/app_color.dart';
import 'package:app_todo/app/utils/style/app_typography.dart';
import 'package:app_todo/app/utils/widgets/app_bar_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'widgets/filter_chip_component.dart';
import 'widgets/title_and_filter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AlertsDialog, Greeting {
  final hourFormati = DateFormat('H:mm').format(DateTime.now());

  late String saudacoes = greeting(hourFormati);
  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        implyLeading: false,
        title: Text(
          saudacoes,
          style: AppTypography.boldText!.copyWith(
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
                  todos: context.read<HomeController>().todos.length,
                  function: (value) {
                    context.read<HomeController>().toggleChip(value);
                    pageController.previousPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.ease);
                  },
                  isSelected: context.watch<HomeController>().isSelected,
                ),
                const SizedBox(
                  width: 15,
                ),
                FilterChipComponent(
                  title: 'Feitas',
                  todos: context.read<HomeController>().done.length,
                  function: (value) {
                    context.read<HomeController>().toggleChip(value);
                    pageController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.ease,
                    );
                  },
                  isSelected: !context.watch<HomeController>().isSelected,
                ),
              ],
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      TitleAndFilter(
                        title: 'Minhas tarefas',
                        filter: [
                          const PopupMenuItem(
                            value: 1,
                            child: Text('Filtrar por data'),
                          ),
                          const PopupMenuItem(
                            value: 2,
                            child: Text('Filtrar por nome'),
                          ),
                          const PopupMenuItem(
                            value: 3,
                            child: Text('Filtrar por numero'),
                          ),
                          PopupMenuItem(
                            value: 4,
                            child: const Text('Deletar todas as tarefas'),
                            onTap: () {
                              showAlert(() {
                                context.read<HomeController>().removeAllTodo();
                                Navigator.pop(context);
                              });
                            },
                          )
                        ],
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
                                itemCount:
                                    context.read<HomeController>().todos.length,
                                itemBuilder: (_, t) {
                                  return Consumer<HomeController>(
                                      builder: (_, todo, child) {
                                    return Dismissible(
                                      direction: DismissDirection.horizontal,
                                      background: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.delete_outlined,
                                            color: AppColor.red.shade700,
                                          ),
                                          Text(
                                            AppConstants.deleteTask,
                                            style: AppTypography.normal!
                                                .copyWith(
                                                    color:
                                                        AppColor.red.shade700,
                                                    fontWeight:
                                                        FontWeight.w600),
                                          )
                                        ],
                                      ),
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
                  context.watch<HomeController>().done.isEmpty
                      ? const Center(
                          child: Text('Nenhuma tarefa'),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            TitleAndFilter(title: 'Tarefas feitas', filter: [
                              PopupMenuItem(
                                value: 1,
                                child: const Text(
                                  'Eliminar todas',
                                ),
                                onTap: () {
                                  showAlert(() {
                                    context
                                        .read<HomeController>()
                                        .removeAllTodoDone();
                                    Navigator.pop(context);
                                  });
                                },
                              ),
                            ]),
                            Consumer<HomeController>(builder: (_, done, child) {
                              return Expanded(
                                child: ListView.builder(
                                    itemCount: done.done.length,
                                    itemBuilder: (_, d) {
                                      return ListTile(
                                        title: Text(done.done[d].title),
                                      );
                                    }),
                              );
                            })
                          ],
                        )
                ],
              ),
            )
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
