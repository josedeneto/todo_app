import 'package:flutter/material.dart';

import '../../../core/colors/app_color.dart';

class MarkDoneTodo extends StatelessWidget {
  const MarkDoneTodo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: const Color.fromARGB(43, 153, 109, 255),
            border: const Border.fromBorderSide(BorderSide.none),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.5),
            child: Text(
              'Concluído',
              style: theme.bodySmall!.copyWith(
                    fontSize: 11,
                    color: AppColor.secondary,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
