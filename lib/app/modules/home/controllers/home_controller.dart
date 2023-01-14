import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/category_model.dart';
import 'package:xmshop/app/models/focus_model.dart';
import 'package:xmshop/app/models/plist_model.dart';
import 'package:xmshop/app/services/https_client.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();
  // 导航状态
  RxBool flag = false.obs;

  RxList<FocusModelItemModel> swiperList = <FocusModelItemModel>[].obs;
  RxList<FocusModelItemModel> bestSellingSwiperList =
      <FocusModelItemModel>[].obs;

  RxList<CategoryItemModel> categorySwiperList = <CategoryItemModel>[].obs;

  RxList<PlistItemModel> sellingList = <PlistItemModel>[].obs;

  RxList<PlistItemModel> goodsList = <PlistItemModel>[].obs;

  HttpsClient httpsClient = HttpsClient();

  @override
  void onInit() {
    super.onInit();

    getFoucusData();
    getBestSellingData();
    getCategoryData();
    getSellingListData();
    getGoodsListData();

    setScrollListener();
  }

  getFoucusData() async {
    var res = await httpsClient.get("api/focus");
    if (res != null) {
      FocusModel focus = FocusModel.fromJson(res.data);
      swiperList.value = focus.result!;
      update();
    }
  }

  getBestSellingData() async {
    var res = await httpsClient.get("api/focus?position=2");
    if (res != null) {
      FocusModel focus = FocusModel.fromJson(res.data);
      bestSellingSwiperList.value = focus.result!;
      update();
    }
  }

  getCategoryData() async {
    var res = await httpsClient.get("api/bestCate");
    if (res != null) {
      CategoryModel category = CategoryModel.fromJson(res.data);
      categorySwiperList.value = category.result!;
      update();
    }
  }

  getSellingListData() async {
    var res = await httpsClient.get("api/plist?is_hot=1&pageSize=3");
    if (res != null) {
      PlistModel pList = PlistModel.fromJson(res.data);
      sellingList.value = pList.result!;
      update();
    }
  }

  getGoodsListData() async {
    var res = await httpsClient.get("api/plist?is_best=1");
    if (res != null) {
      PlistModel pList = PlistModel.fromJson(res.data);
      goodsList.value = pList.result!;
      update();
    }
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
