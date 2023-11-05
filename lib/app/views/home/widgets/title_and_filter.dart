import 'package:flutter/material.dart';
import '../../../core/colors/app_color.dart';
import '../../../core/style/app_typography.dart';

class TitleAndFilter extends StatelessWidget {
  final String title;
  final List<PopupMenuItem> filter;
  const TitleAndFilter({
    required this.title,
    required this.filter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTypography.boldText!.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        PopupMenuButton(
            icon: Icon(
              Icons.more_vert_rounded,
              color: AppColor.grey,
            ),
            itemBuilder: (_) {
              return filter;
            })
      ],
    );
  }
}
