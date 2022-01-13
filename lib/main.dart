import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youtube_ui_clone/view/Pages/home_page.dart';
import 'package:youtube_ui_clone/view/Pages/test.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(420, 810),
      minTextAdapt: true,
      builder: () {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Roboto'),
          home: const HomePage(),
        );
      }
    ),
  );
}
