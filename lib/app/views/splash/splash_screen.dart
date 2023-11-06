import 'package:app_todo/app/core/colors/app_color.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Olá!',
              style: AppTypography.boldText!.copyWith(
                fontSize: 37,
                fontWeight: FontWeight.w600,
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
                      fontWeight: FontWeight.w600,
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  side: const BorderSide(
                    color: AppColor.primary,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Text(
                  'Começar',
                  style: AppTypography.normal!.copyWith(
                    fontWeight: FontWeight.w700,
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
