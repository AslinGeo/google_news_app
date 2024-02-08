import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_news_app/constants/appcolors.dart';
import 'package:google_news_app/data/model/news.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class IndividualView extends GetResponsiveView {
  News news;
  IndividualView({super.key, required this.news});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(),
        body: body(news),
      )),
    );
  }
}

body(News news) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: InkWell(
      onTap: () {
        // Handle tap event, e.g., open the news article in a web view
        // You can use the provided 'url' attribute
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (news.url != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/loader.gif', // Placeholder image
                  image: news.url!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200, // Adjust height as needed
                ),
              ),
              const SizedBox(height: 12),
            ],
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
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
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
                  news.publishedDate != null
                      ? DateFormat.yMMMd().format(news.publishedDate!)
                      : "", // You might want to format the date
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
