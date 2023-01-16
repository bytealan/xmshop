import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/plist_model.dart';
import 'package:xmshop/app/services/https_client.dart';

class ProductListController extends GetxController {
  ScrollController scrollController = ScrollController();
  RxList<PlistItemModel> pList = <PlistItemModel>[].obs;

  int page = 1;
  int pageSize = 10;
  bool flag = true;
  RxBool hasData = true.obs;
  String sort = "all_-1";

  String? keyWords = Get.arguments['keyWords'];
  String? cId = Get.arguments['cId'];
  String apiUri = "";

  HttpsClient httpsClient = HttpsClient();

  GlobalKey<ScaffoldState> scaffoldGlobalKey = GlobalKey<ScaffoldState>();

  List subHeaderList = [
    {
      "id": 1,
      "title": "综合",
      "fileds": "all",
      "sort": -1,
    },
    {
      "id": 2,
      "title": "销量",
      "fileds": "salecount",
      "sort": -1,
    },
    {
      "id": 3,
      "title": "价格",
      "fileds": "price",
      "sort": -1,
    },
    {
      "id": 4,
      "title": "筛选",
    },
  ];

  RxInt selectHeaderId = 1.obs;
  RxInt subHeaderListSort = 1.obs;

  @override
  void onInit() {
    super.onInit();

    getPlistData();

    initScrollController();
  }

  void initScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent - 20) {
        getPlistData();
      }
    });
  }

  void getPlistData() async {
    if (flag && hasData.value) {
      flag = false;
      if (cId != null) {
        apiUri = "api/plist?cid=$cId&page=$page&pageSize=$pageSize&sort=$sort";
      } else {
        apiUri =
            "api/plist?search=$keyWords&page=$page&pageSize=$pageSize&sort=$sort";
      }
      print(apiUri);
      var res = await httpsClient.get(apiUri);
      if (res != null) {
        PlistModel pListModel = PlistModel.fromJson(res.data);
        pList.addAll(pListModel.result!);
        page++;
        update();
        flag = true;
        if (pListModel.result!.length < pageSize) {
          hasData.value = false;
        }
      }
    }
  }

  void subHeaderChange(id) {
    if (id == 4) {
      scaffoldGlobalKey.currentState!.openEndDrawer();
    } else {
      if (selectHeaderId.value == id) {
        subHeaderList[id - 1]["sort"] *= -1;
      }
      selectHeaderId.value = id;
      sort =
          "${subHeaderList[id - 1]["fileds"]}_${subHeaderList[id - 1]["sort"]}";
      subHeaderListSort.value = subHeaderList[id - 1]["sort"];
      page = 1;
      hasData.value = true;
      pList.value = [];
      scrollController.jumpTo(0);
      getPlistData();
    }
  }
}
