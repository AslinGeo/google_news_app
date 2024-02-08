import 'package:get/get.dart';
import 'package:google_news_app/pages/home/home.controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
