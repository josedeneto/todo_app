import 'package:app_todo/app/core/helpers/extensions/navigators_extension.dart';
import 'package:app_todo/app/core/helpers/mixins/messages_validate.dart';
import 'package:app_todo/app/core/routes/app_routes.dart';
import 'package:app_todo/app/pages/home/controller/home_controller.dart';
import 'package:app_todo/app/pages/home/widgets/todo_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../core/colors/app_color.dart';
import '../../core/strings/app_strings.dart';
import '../../core/helpers/mixins/alert_dialog.dart';
import '../../core/helpers/mixins/greeting.dart';
import 'widgets/dismissible_widget.dart';
import 'widgets/drawer_widget.dart';
import 'widgets/filter_chip_widget.dart';
import 'widgets/title_and_filter.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AlertsDialog, Greeting, MessageValidator {
  final hourFormat = DateFormat('H:mm').format(DateTime.now());

  late String saudacoes = greeting(hourFormat);
  late PageController pageController;
  final _advancedDrawerController = AdvancedDrawerController();
  void updateStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: context.read<HomeController>().isDarkMode
            ? Brightness.light
            : Brightness.dark,
        statusBarBrightness: context.read<HomeController>().isDarkMode
            ? Brightness.light
            : Brightness.light,
        statusBarColor: context.read<HomeController>().isDarkMode
            ? AppColor.background
            : AppColor.white));
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    updateStatusBarColor();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeController = context.read<HomeController>();
    final isDarkMode = context.watch<HomeController>().isDarkMode;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return AdvancedDrawer(
      openRatio: 0.70,
      openScale: 0.70,
      backdrop: Container(
        decoration:
            BoxDecoration(color:colorScheme.background,),
      ),
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      controller: _advancedDrawerController,
      drawer: const DrawerWidget(),
      child: Scaffold(
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
                      saudacoes,
                      style:
                         theme.textTheme.headlineMedium!.copyWith(
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
                        color: isDarkMode
                            ? AppColor.white
                            : AppColor.background,
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
                      isSelected:homeController.isSelected,
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
                                          style: theme
                                              .textTheme
                                              .bodySmall!
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
                                style: theme
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pushNamed(AppRoutes.addTodo);
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
