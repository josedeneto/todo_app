import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';


import '../../../core/colors/app_color.dart';
import '../../../core/style/app_typography.dart';

class DatePickerTimeLine extends StatelessWidget {
  final Function(DateTime) onDateChanged;
  const DatePickerTimeLine({
    required this.onDateChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      
      locale: "pt_PT",
      DateTime.now(),
      initialSelectedDate: DateTime.now(),
      dateTextStyle: AppTypography.normal!.copyWith(
        color: AppColor.hint,
        fontSize: 16,
      ),
      width: 75,
      onDateChange: onDateChanged,
      selectedTextColor:  Theme.of(context).colorScheme.tertiary,
      monthTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 13,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
      selectionColor: AppColor.secondary,
      dayTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontSize: 12,
          ),
      height: 84,
    );
  }
}
