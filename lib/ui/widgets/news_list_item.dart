import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:tech_test/controller/all_news_controller.dart';
import 'package:tech_test/data/models/response/news_item.dart';

class NewsListItem extends StatelessWidget {
  final NewsItem item;
  const NewsListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AllNewsController>();
    return InkWell(
      onTap: () => Get.toNamed('/news-details', parameters: {'id': item.id ?? ""}),
      child: Card(
        child: ListTile(
          title: Text(item.webTitle ?? ""),
          subtitle: Text(item.sectionName ?? ""),
          leading: const CircleAvatar(),
        ),
      ),
    );
  }
}
