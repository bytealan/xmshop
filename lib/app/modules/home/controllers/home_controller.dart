import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = new ScrollController();
  // 导航状态
  RxBool flag = false.obs;

  List swiperList = [
    {
      "url": "https://www.itying.com/images/focus/focus01.png",
    },
    {
      "url": "https://www.itying.com/images/focus/focus02.png",
    }
  ];

  @override
  void onInit() {
    super.onInit();
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

  @override
  void onClose() {
    super.onClose();
  }
}
