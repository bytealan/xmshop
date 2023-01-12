import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/focus_model.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();
  // 导航状态
  RxBool flag = false.obs;

  RxList<FocusModelItemModel> swiperList = <FocusModelItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getFoucusData();
    setScrollListener();
  }

  getFoucusData() async {
    var res = await Dio().get("https://xiaomi.itying.com/api/focus");
    FocusModel focus = FocusModel.fromJson(res.data);
    swiperList.value = focus.result!;

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
