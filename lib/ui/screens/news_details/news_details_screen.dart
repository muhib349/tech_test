import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_test/controller/news_details_controller.dart';
import 'package:tech_test/ui/widgets/app_bar_widget.dart';
import 'package:tech_test/ui/widgets/loading_widget.dart';

class NewsDetailsScreen extends StatelessWidget {

  NewsDetailsScreen({super.key});

  final _controller = Get.find<NewsDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'News Details'),
      body: Obx((){
        if(_controller.isLoading.value){
          return const LoadingWidget();
        }else if(_controller.errorMessage.isNotEmpty){
          return Center(
            child: Text(_controller.errorMessage.value),
          );
        }
        var newsItem = _controller.newsItem.value;

        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
                "id : ${newsItem.id}\n"
                    "type: ${newsItem.type}\n"
                    "sectionId: ${newsItem.sectionId}\n"
                    "sectionName: ${newsItem.sectionName}\n"
                    "webPublicationDate: ${newsItem.webPublicationDate}\n"
                    "webTitle: ${newsItem.webTitle}\n"
                    "webUrl: ${newsItem.webUrl}\n"
                    "apiUrl: ${newsItem.apiUrl}\n"
                    "isHosted: ${newsItem.isHosted}\n"
                    "pillarId: ${newsItem.pillarId}\n"
                    "pillarName: ${newsItem.pillarName}\n"
            ),
          ),
        );
      }),
    );
  }
}
