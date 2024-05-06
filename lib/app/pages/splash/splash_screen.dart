import 'package:app_todo/app/core/colors/app_color.dart';
import 'package:app_todo/app/core/helpers/extensions/navigators_extension.dart';
import 'package:app_todo/app/core/routes/app_routes.dart';
import 'package:app_todo/app/core/strings/app_strings.dart';
import 'package:app_todo/app/pages/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                fontSize: 37,color: context.watch<HomeController>().isDarkMode?AppColor.white:AppColor.background
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
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500,fontSize: 18,color:const Color.fromARGB(255, 90, 59, 163),),
                  ),
                  TextSpan(
                    text: ' \n${AppStrings.messageToUser}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16),
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
                  backgroundColor:const Color.fromARGB(255, 78, 55, 133),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide.none,
                ),
                child: Text(
                  'Começar',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600, color: AppColor.white
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
