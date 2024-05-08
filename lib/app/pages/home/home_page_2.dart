/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/colors/app_color.dart';
import '../../core/strings/app_strings.dart';
import 'controller/home_controller.dart';
import 'widgets/filter_chip_widget.dart';
import 'widgets/title_and_filter.dart';
import 'widgets/todo_tile_widget.dart';

class HomePage2 extends StatefulWidget {

  const HomePage2({ super.key });

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _greeting,
                      style: theme.textTheme.headlineMedium!.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _advancedDrawerController.showDrawer();
                      },
                      icon: Icon(
                        Icons.sort,
                        color:
                            isDarkMode ? AppColor.white : AppColor.background,
                      ),
                    )
                  ],
                ),
                Text(
                  'José Neto',
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FilterChipWidget(
                      title: 'Todas',
                      todos: homeController.todos.length,
                      function: (value) {
                        homeController.toggleChip(value);
                        pageController.previousPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.ease,
                        );
                      },
                      isSelected: homeController.isSelected,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    FilterChipWidget(
                      title: 'Feitas',
                      todos: homeController.done.length,
                      function: (value) {
                        homeController.toggleChip(value);
                        pageController.nextPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.ease,
                        );
                      },
                      isSelected: !homeController.isSelected,
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
                              PopupMenuItem(
                                value: 1,
                                height: 25,
                                onTap: homeController.todos.isEmpty
                                    ? null
                                    : () {
                                        showAlert(() {
                                          homeController.removeAllTodo();
                                          messageDeleteAllTodo();
                                          Navigator.pop(context);
                                        });
                                      },
                                child: Text(
                                  'Eliminar todas',
                                  style: theme.textTheme.bodySmall!.copyWith(
                                      color: homeController.todos.isEmpty
                                          ? AppColor.textNull
                                          : null),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          homeController.todos.isEmpty
                              ? Expanded(
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/3.png',
                                          height: 110,
                                        ),
                                        Text(
                                          AppStrings.messageNoTodo,
                                          textAlign: TextAlign.center,
                                          style: theme.textTheme.bodySmall!
                                              .copyWith(
                                                  color: AppColor.grey,
                                                  fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Consumer<HomeController>(
                                  builder: (_, todo, child) => Expanded(
                                    child: ListView.separated(
                                      physics: const BouncingScrollPhysics(
                                        decelerationRate:
                                            ScrollDecelerationRate.fast,
                                      ),
                                      separatorBuilder: (_, i) =>
                                          const SizedBox(
                                        height: 40,
                                      ),
                                      itemCount: todo.todos.length,
                                      itemBuilder: (_, t) {
                                        return AnimationConfiguration
                                            .staggeredList(
                                          delay:
                                              const Duration(milliseconds: 500),
                                          duration:
                                              const Duration(milliseconds: 500),
                                          position: t,
                                          child: SlideAnimation(
                                            child: SlideAnimation(
                                              child: DismissibleWidget(
                                                isDoneTodo: todo.done
                                                    .contains(todo.todos[t]),
                                                key: Key(todo.todos[t].id),
                                                confirmDismiss: () async {
                                                  return showAlertConfirmDeleteUniqueTodo();
                                                },
                                                onDismissed: () {
                                                  todo.removeAtt(todo.todos[t]);
                                                  messageDeleteTodo();
                                                },
                                                todoModel: todo.todos[t],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      homeController.done.isEmpty
                          ? Center(
                              child: Text(
                                'Nenhuma tarefa',
                                style: theme.textTheme.bodySmall!.copyWith(
                                  color: AppColor.grey,
                                  fontSize: 14,
                                ),
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                TitleAndFilter(
                                    title: 'Tarefas feitas',
                                    filter: [
                                      PopupMenuItem(
                                        value: 1,
                                        child: const Text(
                                          'Eliminar todas',
                                        ),
                                        onTap: () {
                                          showAlert(() {
                                            homeController.removeAllTodoDone();
                                            Navigator.pop(context);
                                          });
                                        },
                                      ),
                                    ]),
                                Consumer<HomeController>(
                                  builder: (_, done, child) {
                                    return Expanded(
                                      child: ListView.builder(
                                        itemCount: done.done.length,
                                        itemBuilder: (_, d) {
                                          return TodoTileWidget(
                                            isDoneTodo: done.done
                                                .contains(done.done[d]),
                                            todoModel: done.done[d],
                                          );
                                        },
                                      ),
                                    );
                                  },
                                )
                              ],
                            )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
       );
  }
}*/