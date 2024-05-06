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
    return FilterChip(
      showCheckmark: false,
      selected: isSelected,
      label: Text(
        '$title($todos)',
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.w300,
              fontSize: 15,
              color: isSelected
                  ? AppColor.white
                  : (!isSelected
                      ? (context.watch<HomeController>().isDarkMode
                          ? AppColor.white
                          : AppColor.background)
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
