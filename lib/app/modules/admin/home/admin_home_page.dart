import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/deposit/admin_deposit_page.dart';
import 'package:leitureca/app/modules/admin/home/admin_home_controller.dart';
import 'package:leitureca/app/modules/admin/products/admin_products_page.dart';
import 'package:leitureca/app/modules/admin/users/admin_user_page.dart';
import 'package:leitureca/app/user_controller.dart';
import 'package:leitureca/app/widgets/adminBottombar/admin_bottom_bar.dart';
import 'package:leitureca/app/widgets/adminBottombar/admin_bottom_bar_controller.dart';



class AdminHomePage extends GetView<AdminHomeController> {
  UserController userController = Get.find<UserController>();
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
                AdminProductsPage(),
                AdminDepositPage()
              ],
            ),
            bottomNavigationBar: AdminBottomNavigationbar(),
          );
        });
  }
}
