import 'package:get/get.dart';
import 'package:tech_test/bindings/all_news_bindings.dart';
import 'package:tech_test/bindings/news_details_bindings.dart';
import 'package:tech_test/ui/screens/all_news/all_news_screen.dart';
import 'package:tech_test/ui/screens/news_details/news_details_screen.dart';

final List<GetPage> routes = [
  GetPage(
      name: '/', page: () => const AllNewsScreen(), binding: AllNewsBindings(),
  ),
  GetPage(
    name: '/news-details', page: () => NewsDetailsScreen(), binding: NewsDetailsBindings(),
  ),
];
