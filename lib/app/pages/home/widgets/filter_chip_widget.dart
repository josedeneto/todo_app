import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/colors/app_color.dart';
import '../controller/home_controller.dart';

class FilterChipWidget extends StatelessWidget {
  final String title;
  final int todos;
  final Function(bool)? function;
  final bool isSelected;
  const FilterChipWidget(
      {Key? key,
      required this.title,
      required this.todos,
      required this.function,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = context.watch<HomeController>().isDarkMode;
    return FilterChip(
      showCheckmark: false,
      selected: isSelected,
      label: Text(
        '$title($todos)',
        style: theme.textTheme.bodySmall!.copyWith(
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.w300,
          fontSize: 15,
          color: isSelected
              ? AppColor.white
              : (!isSelected
                  ? (isDarkMode ? AppColor.white : AppColor.red)
                  : AppColor.white),
        ),
      ),
      onSelected: function,
      side: !isSelected
          ? const BorderSide(
              color: AppColor.hint,
              width: 0.30,
              style: BorderStyle.solid,
            )
          : BorderSide.none,
    );
  }
}
