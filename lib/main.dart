import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:leitureca/app/modules/home/home_binding.dart';
import 'package:leitureca/app/modules/shopping/shopping_controller.dart';
import 'package:leitureca/app/routes/app_pages.dart';
import 'package:leitureca/app/theme/app_theme.dart';
import 'package:leitureca/app/widgets/bottombar/bottom_bar_controller.dart';
import 'package:leitureca/utils/parse_config.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'app/modules/home/home_page.dart';

void main() async {
  await Parse().initialize(
    KEYAPPLICATIONID,
    KEYPARSESERVERURL,
    clientKey: CLIENTKEY
  );
  var dietPlan = ParseObject('DietPlan')
	..set('Name', 'Ketogenic')
	..set('Fat', 65);
await dietPlan.save();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<BottomBarController>(() => BottomBarController());
    Get.lazyPut<ShoppingController>(() => ShoppingController());
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
