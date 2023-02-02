import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/productContent/controllers/product_content_controller.dart';
import 'package:xmshop/app/services/screen_adapter.dart';

class FirstPageView extends GetView {
  @override
  final ProductContentController controller = Get.find();

  FirstPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.width(20)),
      key: controller.gk1,
      width: ScreenAdapter.width(1080),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.network(
              "https://www.itying.com/images/flutter/p1.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
            child: Text(
              "哈哈",
              style: TextStyle(
                color: Colors.black87,
                fontSize: ScreenAdapter.fontSize(46),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
            child: Text(
              "副标题",
              style: TextStyle(
                color: Colors.black87,
                fontSize: ScreenAdapter.fontSize(34),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      "价格：",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "¥128",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: ScreenAdapter.fontSize(86),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "原价：",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "¥158",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.black26,
                        fontSize: ScreenAdapter.fontSize(46),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // 筛选
          Container(
            height: ScreenAdapter.height(140),
            padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
            child: GestureDetector(
              onTap: (() {
                Get.bottomSheet(Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(ScreenAdapter.width(20)),
                  width: double.infinity,
                  height: ScreenAdapter.height(1200),
                  child: ListView(
                    children: [
                      Wrap(
                        children: [
                          // 版本
                          Container(
                            padding: EdgeInsets.only(
                              top: ScreenAdapter.height(20),
                              left: ScreenAdapter.width(20),
                            ),
                            width: ScreenAdapter.width(1040),
                            child: const Text(
                              "版本",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: ScreenAdapter.height(20),
                              left: ScreenAdapter.width(20),
                            ),
                            width: ScreenAdapter.width(1040),
                            child: Wrap(
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.all(ScreenAdapter.width(10)),
                                  child: Chip(
                                    padding: EdgeInsets.only(
                                        left: ScreenAdapter.width(20),
                                        right: ScreenAdapter.width(20)),
                                    label: const Text("8GB+128GB"),
                                    backgroundColor:
                                        const Color.fromARGB(31, 223, 213, 213),
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.all(ScreenAdapter.width(10)),
                                  child: Chip(
                                    padding: EdgeInsets.only(
                                        left: ScreenAdapter.width(20),
                                        right: ScreenAdapter.width(20)),
                                    label: const Text("16GB+128GB"),
                                    backgroundColor:
                                        const Color.fromARGB(31, 223, 213, 213),
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.all(ScreenAdapter.width(10)),
                                  child: Chip(
                                    padding: EdgeInsets.only(
                                        left: ScreenAdapter.width(20),
                                        right: ScreenAdapter.width(20)),
                                    label: const Text("16GB+256GB"),
                                    backgroundColor:
                                        const Color.fromARGB(31, 223, 213, 213),
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.all(ScreenAdapter.width(10)),
                                  child: Chip(
                                    padding: EdgeInsets.only(
                                        left: ScreenAdapter.width(20),
                                        right: ScreenAdapter.width(20)),
                                    label: const Text("32GB+256GB"),
                                    backgroundColor:
                                        const Color.fromARGB(31, 223, 213, 213),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // 颜色
                          Container(
                            padding: EdgeInsets.only(
                              top: ScreenAdapter.height(20),
                              left: ScreenAdapter.width(20),
                            ),
                            width: ScreenAdapter.width(1040),
                            child: const Text(
                              "颜色",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: ScreenAdapter.height(20),
                              left: ScreenAdapter.width(20),
                            ),
                            width: ScreenAdapter.width(1040),
                            child: Wrap(
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.all(ScreenAdapter.width(10)),
                                  child: Chip(
                                    padding: EdgeInsets.only(
                                        left: ScreenAdapter.width(20),
                                        right: ScreenAdapter.width(20)),
                                    label: const Text("红色"),
                                    backgroundColor:
                                        const Color.fromARGB(31, 223, 213, 213),
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.all(ScreenAdapter.width(10)),
                                  child: Chip(
                                    padding: EdgeInsets.only(
                                        left: ScreenAdapter.width(20),
                                        right: ScreenAdapter.width(20)),
                                    label: const Text("蓝色"),
                                    backgroundColor:
                                        const Color.fromARGB(31, 223, 213, 213),
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.all(ScreenAdapter.width(10)),
                                  child: Chip(
                                    padding: EdgeInsets.only(
                                        left: ScreenAdapter.width(20),
                                        right: ScreenAdapter.width(20)),
                                    label: const Text("黑色"),
                                    backgroundColor:
                                        const Color.fromARGB(31, 223, 213, 213),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ));
              }),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        "已选",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: ScreenAdapter.width(20),
                        ),
                        child: const Text("黑色，1件"),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black38,
                    size: ScreenAdapter.fontSize(46),
                  ),
                ],
              ),
            ),
          ),
          // 门店
          Container(
            height: ScreenAdapter.height(140),
            padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
            child: InkWell(
              onTap: (() {
                Get.bottomSheet(Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: ScreenAdapter.height(1200),
                  child: ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(248, 255, 252, 252),
                        ),
                        margin: EdgeInsets.all(ScreenAdapter.width(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(ScreenAdapter.height(32)),
                              child: Text("小米之家万达营业点",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(52))),
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.height(32)),
                                child: Text(
                                  "方塔路万达2012铺小米之家",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                )),
                            Padding(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.height(32)),
                                child: Text(
                                  "距离1.04km",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                )),
                            Padding(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.height(32)),
                                child: Text(
                                  "营业时间 9:00-23:00",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(248, 255, 252, 252),
                        ),
                        margin: EdgeInsets.all(ScreenAdapter.width(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(ScreenAdapter.height(32)),
                              child: Text("小米之家万达营业点",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(52))),
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.height(32)),
                                child: Text(
                                  "方塔路万达2012铺小米之家",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                )),
                            Padding(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.height(32)),
                                child: Text(
                                  "距离1.04km",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                )),
                            Padding(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.height(32)),
                                child: Text(
                                  "营业时间 9:00-23:00",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(248, 255, 252, 252),
                        ),
                        margin: EdgeInsets.all(ScreenAdapter.width(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(ScreenAdapter.height(32)),
                              child: Text("小米之家万达营业点",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(52))),
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.height(32)),
                                child: Text(
                                  "方塔路万达2012铺小米之家",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                )),
                            Padding(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.height(32)),
                                child: Text(
                                  "距离1.04km",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                )),
                            Padding(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.height(32)),
                                child: Text(
                                  "营业时间 9:00-23:00",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34)),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
              }),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        "门店",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: ScreenAdapter.width(20),
                        ),
                        child: const Text("小米之家万达专卖店"),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black38,
                    size: ScreenAdapter.fontSize(46),
                  ),
                ],
              ),
            ),
          ),
          // 服务
          Container(
            height: ScreenAdapter.height(140),
            padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
            child: InkWell(
              onTap: (() {
                Get.bottomSheet(Container(
                  padding: EdgeInsets.all(ScreenAdapter.height(40)),
                  color: Colors.white,
                  width: double.infinity,
                  height: ScreenAdapter.height(1000),
                  child: ListView(
                    children: const [
                      Text(
                          '''小米科技有限责任公司成立于2010年3月3日，是专注于智能硬件和电子产品研发、智能手机、智能电动汽车 [355]  、互联网电视及智能家居生态链建设的全球化移动互联网企业、创新型科技企业。 [2-3]  小米公司创造了用互联网模式开发手机操作系统、发烧友参与开发改进的模式。
“为发烧而生”是小米的产品概念。“让每个人都能享受科技的乐趣”是小米公司的愿景。小米公司应用了互联网开发模式开发产品，用极客精神做产品，用互联网模式干掉中间环节，致力让全球每个人，都能享用来自中国的优质科技产品。
小米已经建成了全球最大消费类IoT物联网平台，连接超过5.58 [382]  亿台智能设备，进入全球100多个国家和地区。 [4]  [284]  MIUI全球月活跃用户达到5.64亿 [354]  。小米系投资的公司超500家，覆盖智能硬件、生活消费用品、教育、游戏、社交网络、文化娱乐、医疗健康、汽车交通、金融等领域。 [260] ''')
                    ],
                  ),
                ));
              }),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        "服务",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: ScreenAdapter.width(20),
                        ),
                        child: Image.asset("assets/images/service.png"),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black38,
                    size: ScreenAdapter.fontSize(46),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
