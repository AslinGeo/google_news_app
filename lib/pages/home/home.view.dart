import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_news_app/constants/appcolors.dart';
import 'package:google_news_app/constants/appstrings.dart';
import 'package:google_news_app/data/model/news.dart';
import 'package:google_news_app/pages/home/home.controller.dart';
import 'package:google_news_app/pages/home/individual/individual.view.dart';
import 'package:intl/intl.dart';

class HomeView extends GetResponsiveView<HomeController> {
  HomeView({super.key}) {
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: body(),
    );
  }

  myAppBar() {
    return AppBar(
      leading: Container(),
      backgroundColor: AppColors.white,
      elevation: 0,
      title: Text(
        AppStrings.newsApp,
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.lightGreen),
      ),
      centerTitle: true,
    );
  }

  body() {
    return StreamBuilder<bool>(
      stream: controller.isNetworkAvailable.stream,
      initialData: true, // Assuming internet is initially available
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // Handle loading state
          return const CircularProgressIndicator();
        }
        if (!snapshot.data!) {
          // No internet connection
          return noNetwork();
        } else {
          // Internet connection available, display your normal UI
          return Obx(() => controller.news.value.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.news.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          newsCard(controller.news[index]),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    );
                  })
              : Container());
        }
      },
    );
    // ignore: invalid_use_of_protected_member
  }

  noNetwork() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No Internet Connection',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Please check your network settings and try again.',
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  newsCard(News news) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Get.to(IndividualView(news: news));
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              news.url == null
                  ? Container()
                  : Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(news.url!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              const SizedBox(height: 12),
              Text(
                news.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                news.description ?? "",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: AppColors.lightGreen,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    DateFormat('MMM dd, yyyy').format(news
                        .publishedDate!), // You might want to format the date
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(width: 16),
                  Icon(
                    Icons.source,
                    size: 16,
                    color: AppColors.lightGreen,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    news.source ?? "",
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
