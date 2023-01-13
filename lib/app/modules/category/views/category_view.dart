import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/category_controller.dart';

import '../../../services/screenAdapter.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);

  Widget _leftCate() {
    return SizedBox(
      width: ScreenAdapter.width(280),
      height: double.infinity,
      child: Obx((() => ListView.builder(
            itemBuilder: ((context, index) {
              return SizedBox(
                width: double.infinity,
                height: ScreenAdapter.height(180),
                child: Obx((() => InkWell(
                      onTap: () {
                        controller.changeIndex(index);
                      },
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: ScreenAdapter.width(10),
                              height: ScreenAdapter.height(46),
                              color: index == controller.selectIndex.value
                                  ? Colors.orange
                                  : Colors.white,
                            ),
                          ),
                          Center(
                            child: Text(
                              "${controller.leftCategoryList[index].title}",
                              style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(36),
                                fontWeight:
                                    index == controller.selectIndex.value
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))),
              );
            }),
            itemCount: controller.leftCategoryList.length,
          ))),
    );
  }

  Widget _rightCate() {
    return Expanded(
      flex: 1,
      child: SizedBox(
        height: double.infinity,
        child: Obx((() => GridView.builder(
              itemCount: controller.rightCategoryList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: ScreenAdapter.width(40),
                mainAxisSpacing: ScreenAdapter.height(20),
                childAspectRatio: 240 / 340,
              ),
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Image.network(
                        "https://xiaomi.itying.com/${controller.rightCategoryList[index].pic}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, ScreenAdapter.height(20), 0, 0),
                      child: Text(
                        "${controller.rightCategoryList[index].title}",
                        style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(34),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        actions: [
          IconButton(
              onPressed: (() {}),
              icon: const Icon(Icons.message, color: Colors.black)),
        ],
        elevation: 0,
      ),
      body: Row(
        children: [
          _leftCate(),
          _rightCate(),
        ],
      ),
    );
  }
}
