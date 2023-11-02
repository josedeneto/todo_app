import 'package:app_todo/app/utils/colors/app_color.dart';
import 'package:app_todo/app/utils/style/app_typography.dart';
import 'package:app_todo/app/utils/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/settings_controller.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: const Text('Definições'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.volume_up_rounded,
                  color: AppColor.secondary,
                ),
                const SizedBox(width: 10,),
                Text(
                  'Notificações',
                  style: AppTypography.boldText,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Toque de alarme'),
                Switch.adaptive(
                  value: context.watch<SettingsController>().onNotify,
                  onChanged: (value){
                    context.read<SettingsController>().changeNotification(value);
                  }
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
