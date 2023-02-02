import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/productContent/controllers/product_content_controller.dart';
import 'package:xmshop/app/services/screen_adapter.dart';

class ThirdPageView extends GetView {
  @override
  final ProductContentController controller = Get.find();

  ThirdPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk3,
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(1000),
      color: Colors.red,
      child: Text(
        "推荐",
        style: TextStyle(
          fontSize: ScreenAdapter.fontSize(100),
        ),
      ),
    );
  }
}
