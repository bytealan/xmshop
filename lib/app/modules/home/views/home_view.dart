import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/iconFonts.dart';
import 'package:xmshop/app/services/keepAliveWrapper.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

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
            "https://xiaomi.itying.com/${controller.swiperList[index].pic}",
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
                      "https://xiaomi.itying.com/${controller.categoryList[gridIndex + (swiperIndex * 10)].pic}",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(0, ScreenAdapter.height(4), 0, 0),
                    child: Text(
                      "${controller.categoryList[gridIndex + (swiperIndex * 10)].title}",
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                    ),
                  ),
                ],
              );
            }),
          );
        },
        itemCount: controller.categoryList.length ~/ 10,
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
