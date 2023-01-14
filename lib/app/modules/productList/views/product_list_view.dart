import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/services/https_client.dart';
import 'package:xmshop/app/services/screen_adapter.dart';

import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({Key? key}) : super(key: key);

  Widget _subHeaderWidget() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: ScreenAdapter.height(120),
        width: ScreenAdapter.width(1080),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: ScreenAdapter.height(1),
              color: const Color.fromRGBO(233, 233, 233, 0.9),
            ),
          ),
        ),
        child: Obx((() => Row(
              children: controller.subHeaderList.map((item) {
                return Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      controller.subHeaderChange(item["id"]);
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        ScreenAdapter.height(16),
                        0,
                        ScreenAdapter.height(16),
                      ),
                      child: Text(
                        "${item["title"]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: controller.selectHeaderId.value == item["id"]
                              ? Colors.orange
                              : Colors.black,
                          fontSize: ScreenAdapter.fontSize(32),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ))),
      ),
    );
  }

  Widget _productList() {
    return Obx((() => controller.pList.isNotEmpty
        ? ListView.builder(
            controller: controller.scrollController,
            padding: EdgeInsets.fromLTRB(
                ScreenAdapter.height(20),
                ScreenAdapter.height(140),
                ScreenAdapter.height(20),
                ScreenAdapter.height(20)),
            itemCount: controller.pList.length,
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(ScreenAdapter.height(26)),
                    margin: EdgeInsets.only(bottom: ScreenAdapter.height(20)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        ScreenAdapter.width(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: ScreenAdapter.width(400),
                          height: ScreenAdapter.height(460),
                          padding: EdgeInsets.all(ScreenAdapter.width(60)),
                          child: Image.network(
                            HttpsClient.replaceUri(
                                controller.pList[index].sPic),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: ScreenAdapter.height(20)),
                                child: Text(
                                  "${controller.pList[index].title}",
                                  style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(42),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: ScreenAdapter.height(20)),
                                child: Text(
                                  "${controller.pList[index].subTitle}",
                                  style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(34),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    bottom: ScreenAdapter.height(20)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          Text(
                                            "CPU",
                                            style: TextStyle(
                                              fontSize:
                                                  ScreenAdapter.fontSize(40),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Helio G25",
                                            style: TextStyle(
                                              fontSize:
                                                  ScreenAdapter.fontSize(38),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          Text(
                                            "CPU",
                                            style: TextStyle(
                                              fontSize:
                                                  ScreenAdapter.fontSize(40),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Helio G25",
                                            style: TextStyle(
                                              fontSize:
                                                  ScreenAdapter.fontSize(38),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          Text(
                                            "CPU",
                                            style: TextStyle(
                                              fontSize:
                                                  ScreenAdapter.fontSize(40),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Helio G25",
                                            style: TextStyle(
                                              fontSize:
                                                  ScreenAdapter.fontSize(38),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "￥${controller.pList[index].price}元",
                                style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(38),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  (index == controller.pList.length - 1)
                      ? _processIndicator()
                      : const SizedBox(),
                ],
              );
            }),
          )
        : _processIndicator()));
  }

  Widget _processIndicator() {
    if (controller.hasData.value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return const Center(
        child: Text("没有数据了哦，我是有底线的"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldGlobalKey,
      endDrawer: const Drawer(
        child: DrawerHeader(
          child: Text("右侧筛选"),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        actions: const [SizedBox()],
        title: Container(
          padding: EdgeInsets.fromLTRB(
              ScreenAdapter.width(20), 0, ScreenAdapter.width(20), 0),
          height: ScreenAdapter.height(96),
          width: ScreenAdapter.width(double.infinity),
          decoration: BoxDecoration(
            color: const Color.fromARGB(128, 247, 247, 247),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black12,
                        size: ScreenAdapter.width(50),
                      ),
                      Text(
                        "手机",
                        style: TextStyle(
                            color: Colors.black12,
                            fontSize: ScreenAdapter.fontSize(36)),
                      ),
                    ],
                  )),
              Icon(
                Icons.flip,
                color: Colors.black12,
                size: ScreenAdapter.width(50),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          _productList(),
          _subHeaderWidget(),
        ],
      ),
    );
  }
}
