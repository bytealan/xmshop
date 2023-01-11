import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  // 透明状态栏
  SystemUiOverlayStyle systemUiOverlayStyle =
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  runApp(ScreenUtilInit(
    designSize: const Size(1080, 2400),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: ((context, child) {
      return GetMaterialApp(
        title: "Application",
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    }),
  ));
}
