import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/widgets.dart';

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
      selectedTextColor: AppColor.white,
      monthTextStyle: AppTypography.normal!.copyWith(
        color: AppColor.grey,
        fontSize: 13,
      ),
      selectionColor: AppColor.secondary,
      dayTextStyle: AppTypography.normal!.copyWith(
        color: AppColor.grey,
        fontSize: 12,
      ),
      height: 84,
    );
  }
}
