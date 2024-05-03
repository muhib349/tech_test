import 'package:tech_test/data/models/response/news_item.dart';

class SingleNewsResponse {
  NewsItemResponse? data;

  SingleNewsResponse({this.data});

  SingleNewsResponse.fromJson(Map<String, dynamic> json) {
    data = json['response'] != null ?  NewsItemResponse.fromJson(json['response']) : null;
  }
}

class NewsItemResponse {
  String? status;
  String? userTier;
  int? total;
  NewsItem? content;

  NewsItemResponse({this.status, this.userTier, this.total, this.content,});

  NewsItemResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userTier = json['userTier'];
    total = json['total'];
    content = json['content'] != null ? NewsItem.fromJson(json['content']) : null;
  }
}