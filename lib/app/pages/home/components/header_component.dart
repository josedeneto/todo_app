import 'package:app_todo/app/pages/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/app_color.dart';

class HeaderComponent extends StatelessWidget {
  final String greeting;
  final String userName;
  final Function() openDrawer;
  const HeaderComponent(
      {super.key,
      required this.greeting,
      required this.userName,
      required this.openDrawer});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = context.watch<HomeController>().isDarkMode;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    greeting,
                    style: theme.textTheme.headlineMedium!.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      openDrawer();
                    },
                    icon: Icon(
                      Icons.sort,
                      color: isDarkMode ? AppColor.white : AppColor.background,
                    ),
                  )
                ],
              ),
              Text(
                userName,
                style: theme.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox.shrink()
      ],
    );
  }
}
