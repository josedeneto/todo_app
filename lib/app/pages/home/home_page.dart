import 'package:app_todo/app/core/helpers/extensions/navigators_extension.dart';
import 'package:app_todo/app/core/helpers/mixins/messages_validate.dart';
import 'package:app_todo/app/core/routes/app_routes.dart';
import 'package:app_todo/app/pages/home/components/header_component.dart';
import 'package:app_todo/app/pages/home/components/task_completed.dart';
import 'package:app_todo/app/pages/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../core/helpers/mixins/alert_dialog.dart';
import '../../core/helpers/mixins/greeting.dart';
import 'components/build_filter_components.dart';
import 'components/todo_list_component.dart';
import 'widgets/drawer_widget.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AlertsDialog, Greeting, MessageValidator {
  String _greeting = '';
  void _updateGreeting() {
    final hourFormat = DateFormat('H:mm').format(DateTime.now());
    _greeting = greeting(hourFormat);
  }

  late PageController pageController;
  late final AdvancedDrawerController _advancedDrawerController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    _advancedDrawerController = AdvancedDrawerController();
    _updateGreeting();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    _advancedDrawerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeController = context.read<HomeController>();
    return AdvancedDrawer(
      openRatio: 0.70,
      openScale: 0.70,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
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
                HeaderComponent(
                  greeting: _greeting,
                  userName: 'José Neto',
                  openDrawer: () {
                    _advancedDrawerController.showDrawer();
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                BuildFiltersComponets(
                  homeController: homeController,
                  pageController: pageController,
                ),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                    children: [
                      TodoListWidget(
                        deleteAllTodo: () {
                          showAlert(() {
                            homeController.removeAllTodo();
                            messageDeleteAllTodo();
                            Navigator.pop(context);
                          });
                        },
                        homeController: homeController,
                        messageDeleteTodo: messageDeleteTodo,
                        confirmDeletTodo: showAlertConfirmDeleteUniqueTodo,
                      ),
                      TaskCompleted(
                        homeController: homeController,
                        deleteAllTodo: () {
                          showAlert(() {
                            homeController.removeAllTodoDone();
                            Navigator.pop(context);
                          });
                        },
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
