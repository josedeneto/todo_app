import 'package:app_todo/app/utils/colors/app_color.dart';
import 'package:app_todo/app/utils/style/app_typography.dart';
import 'package:flutter/material.dart';

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
    return FilterChip(
      showCheckmark: false,
      selected: isSelected,
      label: Text(
        '$title($todos)',
        style: AppTypography.boldText!.copyWith(
          fontWeight: isSelected ? FontWeight.w900 : FontWeight.w300,
          fontSize: 16,
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
