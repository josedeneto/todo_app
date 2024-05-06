import 'package:app_todo/app/core/colors/app_color.dart';
import 'package:app_todo/app/core/helpers/extensions/navigators_extension.dart';
import 'package:app_todo/app/core/routes/app_routes.dart';
import 'package:app_todo/app/core/strings/app_strings.dart';
import 'package:app_todo/app/core/style/app_typography.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
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
            Text(
              'Olá!',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 37,color:  Theme.of(context).colorScheme.tertiary
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
                    style: AppTypography.normal!.copyWith(
                     
                      color: AppColor.secondary,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: ' \n${AppStrings.messageToUser}',
                    style: AppTypography.normal!.copyWith(
                      fontSize: 18,
                    ),
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
                  backgroundColor: Color.fromARGB(255, 78, 55, 133),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide.none,
                ),
                child: Text(
                  'Começar',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600
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
