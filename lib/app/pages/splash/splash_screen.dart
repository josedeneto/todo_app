import 'package:app_todo/app/core/colors/app_color.dart';
import 'package:app_todo/app/core/helpers/extensions/navigators_extension.dart';
import 'package:app_todo/app/core/routes/app_routes.dart';
import 'package:app_todo/app/core/strings/app_strings.dart';
import 'package:app_todo/app/core/widgets/app_icon_widget.dart';
import 'package:app_todo/app/pages/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<HomeController>().isDarkMode;
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                AppIcons.logo,
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Olá!',
              style: theme.headlineMedium!.copyWith(
                fontSize: 37,
                color: isDarkMode ? AppColor.white : AppColor.background,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: AppStrings.wellcome,
                    style: theme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: const Color(0xff7159A6),
                    ),
                  ),
                  TextSpan(
                    text: ' \n${AppStrings.messageToUser}',
                    style: theme.bodySmall!.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: 160,
              child: ElevatedButton(
                onPressed: () {
                  context.pushNamed(AppRoutes.home);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(
                      0xff7159A6), // const Color.fromARGB(255, 78, 55, 133),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide.none,
                ),
                child: Text(
                  'Começar',
                  style: theme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColor.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
