import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = new ScrollController();
  RxBool flag = false.obs;

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
