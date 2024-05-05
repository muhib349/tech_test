import 'package:get/get.dart';
import 'package:tech_test/core/base_controller.dart';
import 'package:tech_test/data/models/response/news_item.dart';
import 'package:tech_test/data/network/exceptions/api_exception.dart';
import 'package:tech_test/data/network/exceptions/app_exception.dart';
import 'package:tech_test/repository/news_repository.dart';

class NewsDetailsController extends BaseController {
  final NewsRepository repository;

  NewsDetailsController(this.repository);

  final newsItem = NewsItem().obs;
  var errorMessage = "".obs;

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
    try{
      isLoading.value = true;
      var response = await repository.getNewsById(newsId);
      newsItem.value = response.data?.content ?? NewsItem();
      isLoading.value = false;
    }on ApiException catch(exception){
      errorMessage.value = exception.message;
    } on AppException catch (exception){
      errorMessage.value = exception.message;
    }catch(e){
      e.printError();
    }
  }
}