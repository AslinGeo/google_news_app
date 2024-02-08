import 'package:get/get.dart';
import 'package:google_news_app/pages/home/splash/splash.controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
