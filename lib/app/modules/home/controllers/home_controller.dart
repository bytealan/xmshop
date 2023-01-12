import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/category_model.dart';
import 'package:xmshop/app/models/focus_model.dart';
import 'package:xmshop/app/models/plist_model.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();
  // 导航状态
  RxBool flag = false.obs;

  RxList<FocusModelItemModel> swiperList = <FocusModelItemModel>[].obs;
  RxList<FocusModelItemModel> bestSellingSwiperList =
      <FocusModelItemModel>[].obs;

  RxList<CategoryItemModel> categorySwiperList = <CategoryItemModel>[].obs;

  RxList<PlistItemModel> sellingList = <PlistItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    getFoucusData();
    getBestSellingData();
    getCategoryData();
    getSellingListData();

    setScrollListener();
  }

  getFoucusData() async {
    var res = await Dio().get("https://xiaomi.itying.com/api/focus");
    FocusModel focus = FocusModel.fromJson(res.data);
    swiperList.value = focus.result!;
    update();
  }

  getBestSellingData() async {
    var res = await Dio().get("https://xiaomi.itying.com/api/focus?position=2");
    FocusModel focus = FocusModel.fromJson(res.data);
    bestSellingSwiperList.value = focus.result!;
    update();
  }

  getCategoryData() async {
    var res = await Dio().get("https://xiaomi.itying.com/api/bestCate");
    CategoryModel category = CategoryModel.fromJson(res.data);
    categorySwiperList.value = category.result!;
    update();
  }

  getSellingListData() async {
    var res = await Dio()
        .get("https://xiaomi.itying.com/api/plist?is_hot=1&pageSize=3");
    PlistModel pList = PlistModel.fromJson(res.data);
    sellingList.value = pList.result!;
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
