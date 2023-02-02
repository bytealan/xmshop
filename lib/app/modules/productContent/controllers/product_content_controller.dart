import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductContentController extends GetxController {
  final ScrollController scrollController = ScrollController();

  GlobalKey gk1 = GlobalKey();
  GlobalKey gk2 = GlobalKey();
  GlobalKey gk3 = GlobalKey();

  RxDouble opcity = 0.0.obs;

  RxBool showTabs = false.obs;

  List tabsList = [
    {
      "id": 1,
      "title": "商品",
    },
    {
      "id": 2,
      "title": "详情",
    },
    {
      "id": 3,
      "title": "推荐",
    },
  ];

  RxInt selectedTabsIndex = 1.obs;

  @override
  void onInit() {
    super.onInit();
    screllControllerListener();
  }

  void screllControllerListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels <= 100) {
        opcity.value = scrollController.position.pixels / 100;
        if (showTabs.value) {
          showTabs.value = false;
        }
      } else {
        opcity.value = 1;
        if (!showTabs.value) {
          showTabs.value = true;
        }
      }
      update();
    });
  }

  void changeSelectedTabsIndex(index) {
    selectedTabsIndex.value = index;
    update();
  }
}
