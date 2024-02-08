import 'package:get/get.dart';
import 'package:google_news_app/route/path.dart';

class SplashController extends GetxController {
  init() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed(AppPaths.home);
    });
  }
}
