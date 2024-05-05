import 'package:get/get.dart';
import 'package:tech_test/controller/all_news_controller.dart';
import 'package:tech_test/repository/news_repository_impl.dart';

class AllNewsBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => AllNewsController(Get.find<NewsRepositoryImpl>()));
  }

}