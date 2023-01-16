import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/services/screen_adapter.dart';
import 'package:xmshop/app/services/search_services.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        elevation: 0,
        title: Container(
          height: ScreenAdapter.height(96),
          width: ScreenAdapter.width(double.infinity),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            onChanged: (value) => controller.keyWords = value,
            onSubmitted: ((value) {
              SearchServices.setHistoryData(value);
              Get.offAndToNamed('/product-list',
                  arguments: {"keyWords": value});
            }),
            autofocus: true,
            style: TextStyle(
              fontSize: ScreenAdapter.fontSize(36),
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black12,
                size: ScreenAdapter.width(50),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: (() {
              SearchServices.setHistoryData(controller.keyWords);
              Get.offAndToNamed('/product-list',
                  arguments: {"keyWords": controller.keyWords});
            }),
            child: Text(
              "搜索",
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenAdapter.fontSize(36),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.height(20)),
        children: [
          Obx((() => controller.historyList.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "搜索历史",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenAdapter.fontSize(42),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Get.bottomSheet(Container(
                            padding: EdgeInsets.all(ScreenAdapter.height(20)),
                            color: Colors.white,
                            width: ScreenAdapter.width(1080),
                            height: ScreenAdapter.height(360),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "您确定要清空历史记录吗？",
                                      style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(48)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: ScreenAdapter.height(40),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.black),
                                      ),
                                      onPressed: (() {
                                        Get.back();
                                      }),
                                      child: const Text("取消"),
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.black),
                                      ),
                                      onPressed: (() {
                                        controller.clearHistoryList();
                                        Get.back();
                                      }),
                                      child: const Text("确定"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ));
                        },
                        child: const Icon(Icons.delete_outlined))
                  ],
                )
              : const SizedBox())),
          Obx((() => Wrap(
                children: controller.historyList
                    .map((e) => GestureDetector(
                          onLongPress: () {
                            Get.defaultDialog(
                              title: "提示信息",
                              middleText: "您确定要删除吗？",
                              confirm: ElevatedButton(
                                  onPressed: (() {
                                    controller.removeHistoryList(e);
                                    Get.back();
                                  }),
                                  child: const Text("确定")),
                              cancel: ElevatedButton(
                                  onPressed: (() => Get.back()),
                                  child: const Text("取消")),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                ScreenAdapter.height(40),
                                ScreenAdapter.height(16),
                                ScreenAdapter.height(40),
                                ScreenAdapter.height(16)),
                            margin: EdgeInsets.all(
                              ScreenAdapter.height(16),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  ScreenAdapter.width(20)),
                              color: Colors.white,
                            ),
                            child: Text(
                              "$e",
                              style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(40),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ))),
          SizedBox(
            height: ScreenAdapter.height(40),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "猜你想搜",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenAdapter.fontSize(42),
                ),
              ),
              const Icon(Icons.refresh)
            ],
          ),
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.height(40),
                    ScreenAdapter.height(16),
                    ScreenAdapter.height(40),
                    ScreenAdapter.height(16)),
                margin: EdgeInsets.all(
                  ScreenAdapter.height(16),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ScreenAdapter.width(20)),
                  color: Colors.white,
                ),
                child: Text(
                  "手机",
                  style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(40),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.height(40),
                    ScreenAdapter.height(16),
                    ScreenAdapter.height(40),
                    ScreenAdapter.height(16)),
                margin: EdgeInsets.all(
                  ScreenAdapter.height(16),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ScreenAdapter.width(20)),
                  color: Colors.white,
                ),
                child: Text(
                  "手机壳",
                  style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(40),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.height(40),
                    ScreenAdapter.height(16),
                    ScreenAdapter.height(40),
                    ScreenAdapter.height(16)),
                margin: EdgeInsets.all(
                  ScreenAdapter.height(16),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ScreenAdapter.width(20)),
                  color: Colors.white,
                ),
                child: Text(
                  "电脑",
                  style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(40),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: ScreenAdapter.height(40),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                ScreenAdapter.width(10),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: ScreenAdapter.height(138),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/hot_search.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(ScreenAdapter.width(20)),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: ScreenAdapter.width(40),
                      mainAxisSpacing: ScreenAdapter.height(20),
                      childAspectRatio: 3 / 1,
                    ),
                    itemCount: 8,
                    itemBuilder: ((context, index) {
                      return Row(
                        children: [
                          Container(
                            width: ScreenAdapter.width(120),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(ScreenAdapter.width(10)),
                            child: Image.network(
                              "https://www.itying.com/images/shouji.png",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.width(10)),
                                alignment: Alignment.topLeft,
                                child: const Text("Xiaomi 12S Ultra,专业律卡影像"),
                              ))
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
