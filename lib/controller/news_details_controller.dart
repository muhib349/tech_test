import 'package:get/get.dart';
import 'package:tech_test/core/base_controller.dart';
import 'package:tech_test/data/models/response/news_item.dart';
import 'package:tech_test/repository/news_repository.dart';

class NewsDetailsController extends BaseController {
  final NewsRepository repository;

  NewsDetailsController(this.repository);

  final newsItem = NewsItem().obs;

  String newsId = "";
  @override
  void onInit() {
    newsId = Get.parameters['id'] ?? "";
    if(newsId.isNotEmpty){
      getNewsById();
    }
    super.onInit();
  }

  void getNewsById() async {
    isLoading.value = true;
    var response = await repository.getNewsById(newsId);
    newsItem.value = response.data?.content ?? NewsItem();
    isLoading.value = false;
  }
}