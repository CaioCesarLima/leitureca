import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/home/saldo/saldo_home.dart';
import 'package:leitureca/app/modules/purchase/purchase_page.dart';
import 'package:leitureca/app/modules/shopping/shopping_home.dart';
import 'package:leitureca/app/user_controller.dart';

import 'package:leitureca/app/widgets/bottombar/bottom_bar.dart';
import 'package:leitureca/app/widgets/bottombar/bottom_bar_controller.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<BottomBarController>(),
        builder: (_) {
          return Scaffold(
            body: PageView(
              controller: _.pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                GetBuilder<UserController>(
                  init: Get.find<UserController>(),
                  initState: (_) {},
                  builder: (_) {
                    return SaldoHome();
                  },
                ),
                ShoppingHome(),
                GetBuilder<UserController>(
                  init: Get.find<UserController>(),
                  initState: (_) {},
                  builder: (_) {
                    return PurchasePage();
                  },
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationbar(),
          );
        });
  }
}
