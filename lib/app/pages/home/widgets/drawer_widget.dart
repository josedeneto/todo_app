import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/app_color.dart';
import '../controller/home_controller.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Center(
          child: ListTileTheme(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  maxRadius: 40,
                  backgroundColor: context.watch<HomeController>().isDarkMode
                      ? AppColor.hourColor
                      : AppColor.trackSwitch,
                  child: Icon(
                    Icons.person_outline_rounded,
                    size: 35,
                    color: context.watch<HomeController>().isDarkMode
                        ? AppColor.secondary
                        : const Color(0xff65558F),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'José de Neto',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 70,
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(context.watch<HomeController>().isDarkMode
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined),
                  title: const Text('Modo Dark'),
                  trailing: Transform.scale(
                    scale: 0.80,
                    child: Switch.adaptive(
                      activeColor: AppColor.primary,
                      inactiveThumbColor: AppColor.primary,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      trackOutlineColor: const MaterialStatePropertyAll(
                        Colors.transparent,
                      ),
                      value: context.watch<HomeController>().isDarkMode,
                      onChanged: (dark) =>
                          context.read<HomeController>().activeMode(),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.help_outline_rounded),
                  title: const Text('Ajuda'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.privacy_tip_outlined),
                  title: const Text('Termos & Condições'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.logout_outlined),
                  title: const Text('Sair'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
