import 'package:get/get.dart';
import 'package:tech_test/data/network/api.dart';
import 'package:tech_test/data/network/remote_data_source.dart';
import 'package:tech_test/repository/news_repository_impl.dart';

class InitialBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => RemoteDataSource(Api().dio));
    Get.lazyPut(() => NewsRepositoryImpl(Get.find()));
  }

}