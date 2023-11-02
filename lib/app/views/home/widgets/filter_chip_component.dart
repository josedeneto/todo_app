import 'package:app_todo/app/utils/colors/app_color.dart';
import 'package:flutter/material.dart';

class FilterChipComponent extends StatelessWidget {
  final String title;
  final int todos;
  final Function(bool)? function;
  final bool isSelected;
  const FilterChipComponent(
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
      ),
      onSelected: function,
      side: !isSelected
          ? const BorderSide(
              color: AppColor.hint,
              width: 1,
              style: BorderStyle.solid,
            )
          : BorderSide.none,
    );
  }
}
