import 'package:tech_test/data/models/response/news_item.dart';

class AllNewsResponse {
  Response? data;

  AllNewsResponse({this.data,});

  AllNewsResponse.fromJson(Map<String, dynamic> json) {
    data = json['response'] != null
        ? Response.fromJson(json['response'])
        : null;
  }
}

class Response {
  String? status;
  String? userTier;
  int? total;
  int? startIndex;
  int? pageSize;
  int? currentPage;
  int? pages;
  String? orderBy;
  List<NewsItem>? results;

  Response(
      {this.status,
        this.userTier,
        this.total,
        this.startIndex,
        this.pageSize,
        this.currentPage,
        this.pages,
        this.orderBy,
        this.results,
      });

  Response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userTier = json['userTier'];
    total = json['total'];
    startIndex = json['startIndex'];
    pageSize = json['pageSize'];
    currentPage = json['currentPage'];
    pages = json['pages'];
    orderBy = json['orderBy'];
    if (json['results'] != null) {
      results = <NewsItem>[];
      json['results'].forEach((v) {
        results!.add(NewsItem.fromJson(v));
      });
    }
  }
}


