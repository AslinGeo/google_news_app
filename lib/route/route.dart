import 'package:get/get.dart';
import 'package:google_news_app/pages/home/home.bindings.dart';
import 'package:google_news_app/pages/home/home.view.dart';
import 'package:google_news_app/pages/home/splash/splash.bindings.dart';
import 'package:google_news_app/pages/home/splash/splash.view.dart';
import 'package:google_news_app/route/path.dart';

class AppPages {
  AppPages._();
  static const inital = AppPaths.splash;
  static final route = [
    GetPage(name: AppPaths.splash, page: ()=>SplashView(),binding: SplashBindings()),
    GetPage(name: AppPaths.home, page: ()=>HomeView(),binding: HomeBindings()),

  ];
}
