import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:tech_test/controller/all_news_controller.dart';
import 'package:tech_test/ui/widgets/app_bar_widget.dart';
import 'package:tech_test/ui/widgets/loading_widget.dart';
import 'package:tech_test/ui/widgets/news_list_item.dart';

class AllNewsScreen extends StatefulWidget {
  const AllNewsScreen({super.key});

  @override
  State<AllNewsScreen> createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen> {
  final _scrollController = ScrollController();
  final _controller = Get.find<AllNewsController>();


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const MyAppBar(
        title: 'All News',
      ),
      body: Obx(() {
        if(_controller.isLoading.value && _controller.isFirstFetched){
          return const LoadingWidget();
        }
        return ListView.builder(
          itemCount: _controller.news.length + (_controller.isLoading.value ? 1 : 0),
          itemBuilder: (context, index) {
            if(index < _controller.news.length){
              return NewsListItem(item: _controller.news[index]);
            }else {
              Timer(const Duration(milliseconds: 30), () {
                _scrollController
                    .jumpTo(_scrollController.position.maxScrollExtent);
              });

              return const LoadingWidget();
            }

          },
          controller: _scrollController,
        );
      }),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      _controller.getAllNews();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

}
