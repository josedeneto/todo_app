import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/app_color.dart';

class DatePickerTimeLine extends StatelessWidget {
  final Function(DateTime) onDateChanged;
  const DatePickerTimeLine({
    required this.onDateChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return DatePicker(
      locale: "pt_PT",
      DateTime.now(),
      initialSelectedDate: DateTime.now(),
      dateTextStyle: theme.textTheme.bodySmall!.copyWith(
        color: AppColor.hint,
        fontSize: 16,
      ),
      width: 75,
      onDateChange: onDateChanged,
      selectedTextColor: colorScheme.tertiary,
      monthTextStyle: theme.textTheme.bodySmall!.copyWith(
        fontSize: 13,
        color: colorScheme.onSurfaceVariant,
      ),
      selectionColor: colorScheme.secondary,
      dayTextStyle: theme.textTheme.bodySmall!.copyWith(
        color: colorScheme.onSurfaceVariant,
        fontSize: 12,
      ),
      height: 84,
    );
  }
}
