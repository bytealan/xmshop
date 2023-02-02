import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/productContent/views/first_page_view.dart';
import 'package:xmshop/app/modules/productContent/views/second_page_view.dart';
import 'package:xmshop/app/modules/productContent/views/third_page_view.dart';
import 'package:xmshop/app/services/screen_adapter.dart';

import '../controllers/product_content_controller.dart';

class ProductContentView extends GetView<ProductContentController> {
  const ProductContentView({Key? key}) : super(key: key);

  Widget _appBar(BuildContext context) {
    return Obx((() => AppBar(
          leading: Container(
            alignment: Alignment.center,
            child: SizedBox(
              height: ScreenAdapter.width(86),
              width: ScreenAdapter.width(86),
              child: ElevatedButton(
                onPressed: (() {}),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                  alignment: Alignment.center,
                  backgroundColor: MaterialStateProperty.all(Colors.black12),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(const CircleBorder()),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: ScreenAdapter.width(60),
                ),
              ),
            ),
          ),
          title: SizedBox(
            height: ScreenAdapter.width(96),
            width: ScreenAdapter.width(400),
            child: controller.showTabs.value
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: controller.tabsList.map((v) {
                      return InkWell(
                        onTap: () {
                          controller.changeSelectedTabsIndex(v["id"]);
                          switch (v["id"]) {
                            case 1:
                              Scrollable.ensureVisible(
                                controller.gk1.currentContext as BuildContext,
                                duration: const Duration(milliseconds: 500),
                              );
                              break;
                            case 2:
                              Scrollable.ensureVisible(
                                controller.gk2.currentContext as BuildContext,
                                duration: const Duration(milliseconds: 500),
                              );
                              break;
                            case 3:
                              Scrollable.ensureVisible(
                                controller.gk3.currentContext as BuildContext,
                                duration: const Duration(milliseconds: 500),
                              );
                              break;
                            default:
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                v["title"],
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(36)),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: ScreenAdapter.height(10)),
                                width: ScreenAdapter.width(100),
                                height: ScreenAdapter.height(4),
                                color: v["id"] ==
                                        controller.selectedTabsIndex.value
                                    ? Colors.red
                                    : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  )
                : const SizedBox(),
          ),
          centerTitle: true,
          backgroundColor: Colors.white.withOpacity(controller.opcity.value),
          elevation: 0,
          actions: [
            Container(
              margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
              height: ScreenAdapter.width(86),
              width: ScreenAdapter.width(86),
              child: ElevatedButton(
                onPressed: (() {}),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                  alignment: Alignment.center,
                  backgroundColor: MaterialStateProperty.all(Colors.black12),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(const CircleBorder()),
                ),
                child: Icon(
                  Icons.file_upload_outlined,
                  size: ScreenAdapter.width(60),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
              height: ScreenAdapter.width(86),
              width: ScreenAdapter.width(86),
              child: ElevatedButton(
                onPressed: (() {
                  showMenu(
                    color: Colors.black87.withOpacity(0.7),
                    context: context,
                    position: RelativeRect.fromLTRB(
                      ScreenAdapter.width(800),
                      ScreenAdapter.height(200),
                      ScreenAdapter.width(20),
                      ScreenAdapter.height(0),
                    ),
                    items: [
                      PopupMenuItem(
                        child: Row(
                          children: const [
                            Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                            Text(
                              "首页",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        child: Row(
                          children: const [
                            Icon(
                              Icons.message,
                              color: Colors.white,
                            ),
                            Text(
                              "消息",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        child: Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            Text(
                              "收藏",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                  alignment: Alignment.center,
                  backgroundColor: MaterialStateProperty.all(Colors.black12),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(const CircleBorder()),
                ),
                child: Icon(
                  Icons.more_horiz_rounded,
                  size: ScreenAdapter.width(60),
                ),
              ),
            ),
          ],
        )));
  }

  Widget _body() {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(children: [
        FirstPageView(),
        SecondPageView(),
        ThirdPageView(),
      ]),
    );
  }

  Widget _bottom() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: ScreenAdapter.height(160),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              width: ScreenAdapter.height(2),
              color: Colors.black26,
            ),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: ScreenAdapter.width(140),
              height: ScreenAdapter.height(160),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.headphones_outlined),
                  Text(
                    "客服",
                    style: TextStyle(fontSize: ScreenAdapter.fontSize(32)),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: ScreenAdapter.width(140),
              height: ScreenAdapter.height(160),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star_border_outlined),
                  Text(
                    "收藏",
                    style: TextStyle(fontSize: ScreenAdapter.fontSize(32)),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: ScreenAdapter.width(140),
              height: ScreenAdapter.height(160),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_cart_outlined),
                  Text(
                    "购物车",
                    style: TextStyle(fontSize: ScreenAdapter.fontSize(32)),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: ScreenAdapter.height(120),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(255, 160, 0, 1)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(ScreenAdapter.height(60)),
                          bottomLeft: Radius.circular(ScreenAdapter.height(60)),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "加入购物车",
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                height: ScreenAdapter.height(120),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(253, 113, 18, 1)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(ScreenAdapter.height(60)),
                          bottomRight:
                              Radius.circular(ScreenAdapter.height(60)),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("立即购买"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenAdapter.height(120)),
        child: _appBar(context),
      ),
      body: Stack(
        children: [
          _body(),
          _bottom(),
        ],
      ),
    );
  }
}
