// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_todo/app/utils/colors/app_color.dart';
import 'package:app_todo/app/utils/style/app_typography.dart';
import 'package:flutter/material.dart';

class FilterChipComponent extends StatefulWidget {
  final String title;
  final List<String> todos;
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
  State<FilterChipComponent> createState() => _FilterChipComponentState();
}

class _FilterChipComponentState extends State<FilterChipComponent> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      backgroundColor: AppColor.chips,
      checkmarkColor: AppColor.chips,
      disabledColor: Colors.transparent,
      padding: const EdgeInsets.only(left: 0),
      selected: widget.isSelected,
      label: Text('${widget.title}(${widget.todos.length})'),
      onSelected: widget.function,
      labelStyle: AppTypography.normal,
      side: widget.isSelected
          ? const BorderSide(
              color: AppColor.white,
              style: BorderStyle.solid,
            )
          : BorderSide.none,
    );
  }
}
