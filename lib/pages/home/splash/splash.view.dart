import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_news_app/constants/appcolors.dart';
import 'package:google_news_app/constants/appstrings.dart';
import 'package:google_news_app/pages/home/splash/splash.controller.dart';

class SplashView extends GetResponsiveView<SplashController> {
  SplashView({super.key}) {
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightGreen,
        body: body(),
      ),
    );
  }

  body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            AppStrings.newsApp,
            style: TextStyle(
                color: AppColors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
