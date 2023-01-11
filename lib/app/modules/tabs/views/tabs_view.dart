import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx((() => Scaffold(
          body: PageView(
            children: controller.pages,
            controller: controller.pageController,
            onPageChanged: (value) {
              controller.setCurrentIndex(value);
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.red,
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            onTap: ((value) {
              controller.setCurrentIndex(value);
              controller.pageController.jumpToPage(value);
            }),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "首页",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: "分类",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.room_service),
                label: "服务",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "购物车",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: "用户",
              ),
            ],
          ),
        )));
  }
}
