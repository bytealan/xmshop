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
          SizedBox(
            height: ScreenAdapter.height(750),
            width: ScreenAdapter.width(1080),
            child: Swiper(
              itemBuilder: (context, index) {
                return Image.network(
                  "https://xiaomi.itying.com/${controller.swiperList[index]["pic"]}",
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
          )
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
            ))));
  }
}



// 旧版导航栏

// Positioned(
//           top: 0,
//           left: 0,
//           right: 0,
//           child: Obx((() => AppBar(
//                 backgroundColor:
//                     controller.flag.value ? Colors.white : Colors.transparent,
//                 title: AnimatedContainer(
//                   duration: const Duration(seconds: 1),
//                   width: controller.flag.value
//                       ? ScreenAdapter.width(800)
//                       : ScreenAdapter.width(620),
//                   height: ScreenAdapter.height(96),
//                   decoration: BoxDecoration(
//                     color: controller.flag.value
//                         ? const Color.fromARGB(128, 185, 185, 185)
//                         : const Color.fromARGB(128, 255, 255, 255),
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(ScreenAdapter.width(15), 0,
//                             ScreenAdapter.width(15), 0),
//                         child: const Icon(Icons.search),
//                       ),
//                       Text(
//                         "手机",
//                         style: TextStyle(
//                           fontSize: ScreenAdapter.fontSize(32),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 centerTitle: true,
//                 elevation: 0,
//                 leading: controller.flag.value
//                     ? Container()
//                     : const Icon(
//                         Iconfonts.xiaomi,
//                         color: Colors.white,
//                       ),
//                 leadingWidth:
//                     controller.flag.value ? 0 : ScreenAdapter.width(140),
//                 actions: [
//                   IconButton(
//                     onPressed: (() {}),
//                     icon: const Icon(Icons.qr_code),
//                     color:
//                         controller.flag.value ? Colors.black54 : Colors.white,
//                   ),
//                   IconButton(
//                     onPressed: (() {}),
//                     icon: const Icon(Icons.message),
//                     color:
//                         controller.flag.value ? Colors.black54 : Colors.white,
//                   ),
//                 ],
//               ))),
//         )