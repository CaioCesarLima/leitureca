import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:leitureca/app/modules/home/home_binding.dart';
import 'package:leitureca/app/routes/app_pages.dart';
import 'package:leitureca/app/theme/app_theme.dart';
import 'package:leitureca/app/widgets/bottombar/bottom_bar_controller.dart';

import 'app/modules/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<BottomBarController>(() => BottomBarController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: Routes.INITIAL,
      initialBinding: HomeBinding(),
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      getPages: AppPages.pages,
      home: HomePage(),
    );
  }
}
