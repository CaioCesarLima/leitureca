import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:leitureca/app/modules/shopping/shopping_controller.dart';
import 'package:leitureca/app/modules/splash/splash_bindings.dart';
import 'package:leitureca/app/modules/splash/splash_page.dart';
import 'package:leitureca/app/routes/app_pages.dart';
import 'package:leitureca/app/theme/app_theme.dart';
import 'package:leitureca/app/user_controller.dart';
import 'package:leitureca/app/widgets/bottombar/bottom_bar_controller.dart';
import 'package:leitureca/utils/parse_config.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'app/widgets/adminBottombar/admin_bottom_bar_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 

  await Parse().initialize(
    KEYAPPLICATIONID,
    KEYPARSESERVERURL,
    clientKey: CLIENTKEY
  );

  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<BottomBarController>(() => BottomBarController(), fenix: true);
    Get.lazyPut<AdminBottomBarController>(() => AdminBottomBarController(), fenix: true);
    Get.put<UserController>(UserController());
    Get.lazyPut<ShoppingController>(() => ShoppingController(), fenix: true);
    return GetMaterialApp(
      title: 'Leiturecas',
      initialRoute: Routes.INITIAL,
      initialBinding: SplashBinding(),
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      getPages: AppPages.pages,
      home: SplashPage(),
    );
  }
}
