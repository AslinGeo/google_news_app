import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:google_news_app/data/model/repo/newsprovider.dart';

class HomeController extends GetxController {
  RxList news = [].obs;
  RxBool isNetworkAvailable = true.obs;
  init() {
    checkNetwork();
    fetchNews();
  }

  fetchNews() async {
    news.value = await NewsProvider().fetchNewsArticles();
  }

  checkNetwork() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      isNetworkAvailable.value = false;
    }
    isNetworkAvailable.refresh();
  }
}
