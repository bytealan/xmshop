import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/productContent/controllers/product_content_controller.dart';
import 'package:xmshop/app/services/screen_adapter.dart';

class SecondPageView extends GetView {
  @override
  final ProductContentController controller = Get.find();

  SecondPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk2,
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(2900),
      color: Colors.blue,
      child: Text(
        "详情",
        style: TextStyle(
          fontSize: ScreenAdapter.fontSize(100),
        ),
      ),
    );
  }
}
