import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();
  // 导航状态
  RxBool flag = false.obs;

  RxList swiperList = [].obs;

  @override
  void onInit() {
    super.onInit();
    getFoucusData();
    setScrollListener();
  }

  getFoucusData() async {
    var res = await Dio().get("https://xiaomi.itying.com/api/focus");
    swiperList.value = res.data["result"];
    update();
  }

  setScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels > 10 && !flag.value) {
        flag.value = true;
        update();
      }
      if (scrollController.position.pixels < 10 && flag.value) {
        flag.value = false;
        update();
      }
    });
  }
}
