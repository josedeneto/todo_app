
import 'package:flutter/material.dart';

import '../controller/home_controller.dart';
import '../widgets/filter_chip_widget.dart';

class BuildFiltersComponets extends StatelessWidget {
  const BuildFiltersComponets({
    super.key,
    required this.homeController,
    required this.pageController,
  });

  final HomeController homeController;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}