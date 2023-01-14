import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/https_client.dart';
import 'package:xmshop/app/services/iconFonts.dart';
import 'package:xmshop/app/services/keep_alive_wrapper.dart';
import 'package:xmshop/app/services/screen_adapter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  // 状态栏
  Widget _appBar() {
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: AnimatedContainer(
          padding: EdgeInsets.fromLTRB(
              ScreenAdapter.width(30), ScreenAdapter.height(50), 0, 0),
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
            color: controller.flag.value ? Colors.white : null,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: controller.flag.value ? 0 : 1,
                duration: const Duration(microseconds: 1000),
                child: AnimatedContainer(
                  width: controller.flag.value
                      ? ScreenAdapter.width(0)
                      : ScreenAdapter.width(100),
                  duration: const Duration(milliseconds: 500),
                  child: const Icon(Iconfonts.xiaomi, color: Colors.white),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        ScreenAdapter.width(20), 0, ScreenAdapter.width(20), 0),
                    height: ScreenAdapter.height(96),
                    width: ScreenAdapter.width(600),
                    decoration: BoxDecoration(
                      color: controller.flag.value
                          ? const Color.fromARGB(128, 247, 247, 247)
                          : const Color.fromARGB(128, 255, 255, 255),
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
                  )),
              IconButton(
                  onPressed: (() {}),
                  icon: Icon(Icons.qr_code,
                      color:
                          controller.flag.value ? Colors.black : Colors.white)),
              IconButton(
                  onPressed: (() {}),
                  icon: Icon(Icons.message,
                      color:
                          controller.flag.value ? Colors.black : Colors.white)),
            ],
          ),
        ));
  }

  // 轮播图
  Widget _focus() {
    return SizedBox(
      height: ScreenAdapter.height(750),
      width: ScreenAdapter.width(1080),
      child: Swiper(
        itemBuilder: (context, index) {
          return Image.network(
            HttpsClient.replaceUri(controller.swiperList[index].pic),
            fit: BoxFit.fill,
          );
        },
        itemCount: controller.swiperList.length,
        pagination: const SwiperPagination(
          builder: SwiperPagination.rect,
        ),
        autoplay: true,
        loop: true,
      ),
    );
  }

  // banner
  Widget _banner() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(92),
      child: Image.asset(
        "assets/images/xiaomiBanner.png",
        fit: BoxFit.cover,
      ),
    );
  }

  // 分类
  Widget _category() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(480),
      child: Swiper(
        itemBuilder: (context, swiperIndex) {
          return GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: ScreenAdapter.width(20),
              mainAxisSpacing: ScreenAdapter.height(20),
            ),
            itemBuilder: ((context, gridIndex) {
              return Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: ScreenAdapter.height(140),
                    width: ScreenAdapter.height(140),
                    child: Image.network(
                      HttpsClient.replaceUri(controller
                          .categorySwiperList[gridIndex + (swiperIndex * 10)]
                          .pic),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(0, ScreenAdapter.height(4), 0, 0),
                    child: Text(
                      "${controller.categorySwiperList[gridIndex + (swiperIndex * 10)].title}",
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                    ),
                  ),
                ],
              );
            }),
          );
        },
        itemCount: controller.categorySwiperList.length ~/ 10,
        pagination: SwiperPagination(
          margin: const EdgeInsets.all(0.0),
          builder: SwiperCustomPagination(
              builder: (BuildContext context, SwiperPluginConfig config) {
            return ConstrainedBox(
              constraints:
                  BoxConstraints.expand(height: ScreenAdapter.height(20)),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: const RectSwiperPaginationBuilder(
                        color: Colors.black12,
                        activeColor: Colors.black,
                      ).build(context, config),
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  // banner2
  Widget _banner2() {
    return Padding(
      padding: EdgeInsets.fromLTRB(ScreenAdapter.width(20),
          ScreenAdapter.height(20), ScreenAdapter.width(20), 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenAdapter.width(20)),
          image: const DecorationImage(
            image: AssetImage("assets/images/xiaomiBanner2.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: ScreenAdapter.height(420),
      ),
    );
  }

  // 热销臻选
  Widget _bestSelling() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            ScreenAdapter.width(30),
            ScreenAdapter.height(40),
            ScreenAdapter.width(30),
            ScreenAdapter.height(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "热销臻选",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenAdapter.fontSize(46),
                ),
              ),
              Text(
                "更多手机 >",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: ScreenAdapter.fontSize(38),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            ScreenAdapter.width(20),
            0,
            ScreenAdapter.width(20),
            ScreenAdapter.height(20),
          ),
          child: Row(
            children: [
              // 左侧
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: ScreenAdapter.height(738),
                  child: Swiper(
                    itemBuilder: (context, index) {
                      return Image.network(
                        HttpsClient.replaceUri(
                            controller.bestSellingSwiperList[index].pic),
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: controller.bestSellingSwiperList.length,
                    pagination: SwiperPagination(
                      margin: const EdgeInsets.all(0.0),
                      builder: SwiperCustomPagination(builder:
                          (BuildContext context, SwiperPluginConfig config) {
                        return ConstrainedBox(
                          constraints: BoxConstraints.expand(
                              height: ScreenAdapter.height(30)),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: const RectSwiperPaginationBuilder(
                                    color: Colors.black12,
                                    activeColor: Colors.black,
                                  ).build(context, config),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                    autoplay: true,
                    loop: true,
                  ),
                ),
              ),
              SizedBox(
                width: ScreenAdapter.width(20),
              ),
              // 右侧
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: ScreenAdapter.height(738),
                  child: Column(
                    children:
                        controller.sellingList.asMap().entries.map((entrie) {
                      var value = entrie.value;
                      return Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              entrie.key == controller.sellingList.length - 1
                                  ? 0
                                  : ScreenAdapter.height(20)),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(ScreenAdapter.width(10)),
                            color: const Color.fromARGB(255, 247, 247, 247),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: ScreenAdapter.height(20),
                                    ),
                                    Text(
                                      "${value.title}",
                                      style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(38),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: ScreenAdapter.height(20),
                                    ),
                                    Text(
                                      "${value.subTitle}",
                                      style: TextStyle(
                                        fontSize: ScreenAdapter.fontSize(28),
                                      ),
                                    ),
                                    SizedBox(
                                      height: ScreenAdapter.height(20),
                                    ),
                                    Text(
                                      "¥${value.price}元",
                                      style: TextStyle(
                                        fontSize: ScreenAdapter.fontSize(34),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding:
                                      EdgeInsets.all(ScreenAdapter.height(8)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                          ScreenAdapter.width(10)),
                                      bottomRight: Radius.circular(
                                          ScreenAdapter.width(10)),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        HttpsClient.replaceUri(value.pic),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bestGoods() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            ScreenAdapter.width(30),
            ScreenAdapter.height(40),
            ScreenAdapter.width(30),
            ScreenAdapter.height(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "省心优惠",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenAdapter.fontSize(46),
                ),
              ),
              Text(
                "全部优惠 >",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: ScreenAdapter.fontSize(38),
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(ScreenAdapter.width(20)),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 250, 250, 250),
                Color.fromARGB(255, 247, 247, 247)
              ],
            ),
          ),
          child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: ScreenAdapter.width(30),
            crossAxisSpacing: ScreenAdapter.width(30),
            itemCount: controller.goodsList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(ScreenAdapter.width(20)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(ScreenAdapter.width(10)),
                      child: Image.network(
                        HttpsClient.replaceUri(
                            controller.goodsList[index].sPic),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      "${controller.goodsList[index].title}",
                      style: TextStyle(
                        fontSize: ScreenAdapter.fontSize(36),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${controller.goodsList[index].subTitle}",
                      style: TextStyle(
                        fontSize: ScreenAdapter.fontSize(30),
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: ScreenAdapter.height(20),
                    ),
                    Text(
                      "¥${controller.goodsList[index].price}元",
                      style: TextStyle(
                        fontSize: ScreenAdapter.fontSize(32),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // 内容
  Widget _homeBody() {
    return Positioned(
      top: -25,
      left: 0,
      right: 0,
      bottom: 0,
      child: ListView(
        controller: controller.scrollController,
        children: [
          _focus(),
          _banner(),
          _category(),
          _banner2(),
          _bestSelling(),
          _bestGoods(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: Obx((() => AnnotatedRegion(
            value: controller.flag.value
                ? SystemUiOverlayStyle.dark
                : SystemUiOverlayStyle.light,
            child: Scaffold(
              body: Stack(
                children: [
                  _homeBody(),
                  _appBar(),
                ],
              ),
            ),
          ))),
    );
  }
}
