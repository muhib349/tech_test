import 'dart:developer';

import 'package:get/get.dart';
import 'package:tech_test/core/base_controller.dart';
import 'package:tech_test/data/models/response/news_item.dart';
import 'package:tech_test/data/network/exceptions/api_exception.dart';
import 'package:tech_test/data/network/exceptions/app_exception.dart';
import 'package:tech_test/repository/news_repository.dart';

class AllNewsController extends BaseController {
  final NewsRepository repository;
  AllNewsController(this.repository);

  var news = <NewsItem>[].obs;
  int pageNumber = 1;
  bool isFirstFetched = true;
  var errorMessage = "".obs;

  @override
  void onInit() {
    getAllNews();
    super.onInit();
  }

  void getAllNews() async {
    try{
      isLoading.value = true;
      var response = await repository.getAllNews(pageNumber++);

      news.addAll(response.data?.results ?? []);
      news.refresh();
      isLoading.value = false;

      if(pageNumber > 1){
        isFirstFetched = false;
      }
    } on ApiException catch(exception){
      errorMessage.value = exception.message;
    } on AppException catch (exception){
      errorMessage.value = exception.message;
    }catch(e){
      e.printError();
    }

  }
}