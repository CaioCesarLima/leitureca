import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/home/saldo_home.dart';
import 'package:leitureca/app/modules/home/shopping_home.dart';

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
                SaldoHome(),
                ShoppingHome(),
              ],
            ),
            bottomNavigationBar: BottomNavigationbar(),
          );
        });
  }
}
