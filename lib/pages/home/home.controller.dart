import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:google_news_app/data/model/repo/newsprovider.dart';

class HomeController extends GetxController {
  RxList news = [].obs;
  RxBool isNetworkAvailable = true.obs;
  // ignore: unused_field
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  init() {
    checkNetwork();
    fetchNews();
  }

  fetchNews() async {
    news.value = await NewsProvider().fetchNewsArticles();
  }

  checkNetwork() async {
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        // No internet connection
        isNetworkAvailable.value = false;
      } else {
        // Internet connection available
        isNetworkAvailable.value = true;
      }
      isNetworkAvailable.refresh();
    });
    return isNetworkAvailable.value;
  }
}
