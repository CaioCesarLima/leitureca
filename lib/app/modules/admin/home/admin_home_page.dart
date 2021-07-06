import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/deposit/admin_deposit_page.dart';
import 'package:leitureca/app/modules/admin/home/admin_home_controller.dart';
import 'package:leitureca/app/modules/admin/products/admin_product_page.dart';
import 'package:leitureca/app/modules/admin/users/admin_user_page.dart';
import 'package:leitureca/app/modules/admin/widgets/bottombar/bottom_bar.dart';
import 'package:leitureca/app/modules/admin/widgets/bottombar/bottom_bar_controller.dart';

class AdminHomePage extends GetView<AdminHomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<AdminBottomBarController>(),
        builder: (_) {
          return Scaffold(
            body: PageView(
              controller: _.pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                AdminUserPage(),
                AdminProductPage(),
                AdminDepositPage()
              ],
            ),
            bottomNavigationBar: AdminBottomNavigationbar(),
          );
        });
  }
}
