import 'package:get/get.dart';
import 'package:google_news_app/data/model/repo/newsprovider.dart';

class HomeController extends GetxController {
  RxList news = [].obs;
  init() {
    fetchNews();
  }

  fetchNews() async {
    news.value = await NewsProvider().fetchNewsArticles();
  }
}
