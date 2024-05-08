import 'package:app_todo/app/core/widgets/app_icon_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/app_color.dart';

class NoTasksComponent extends StatelessWidget {
  final String text;
  final String image;
  const NoTasksComponent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIconWidget(
              icon: image,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall!.copyWith(
                color: AppColor.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
