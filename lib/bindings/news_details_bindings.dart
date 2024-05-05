import 'package:get/get.dart';
import 'package:tech_test/controller/news_details_controller.dart';
import 'package:tech_test/repository/news_repository_impl.dart';

class NewsDetailsBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => NewsDetailsController(Get.find<NewsRepositoryImpl>()));
  }

}