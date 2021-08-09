import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/deposit/admin_deposit_bindings.dart';
import 'package:leitureca/app/modules/admin/deposit/admin_deposit_page.dart';
import 'package:leitureca/app/modules/admin/home/admin_home_bindings.dart';
import 'package:leitureca/app/modules/admin/home/admin_home_page.dart';
import 'package:leitureca/app/modules/admin/products/new_products/admin_new_products_bindings.dart';
import 'package:leitureca/app/modules/admin/products/new_products/admin_new_products_page.dart';
import 'package:leitureca/app/modules/admin/purchase/admin_purchase_bindings.dart';
import 'package:leitureca/app/modules/admin/purchase/admin_purchase_page.dart';
import 'package:leitureca/app/modules/admin/users/newUser/admin_newUSer_bindings.dart';
import 'package:leitureca/app/modules/admin/users/newUser/admin_newUser_page.dart';
import 'package:leitureca/app/modules/home/home_binding.dart';
import 'package:leitureca/app/modules/home/home_page.dart';
import 'package:leitureca/app/modules/login/login_bindings.dart';
import 'package:leitureca/app/modules/login/login_page.dart';
import 'package:leitureca/app/modules/product/product_page.dart';
import 'package:leitureca/app/modules/purchase/purchase_bindings.dart';
import 'package:leitureca/app/modules/purchase/purchase_page.dart';
import 'package:leitureca/app/modules/splash/splash_bindings.dart';
import 'package:leitureca/app/modules/splash/splash_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.PRODUCT,
      page: () => ProductPage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.PURCHASE,
      page: () => PurchasePage(),
      binding: PurchaseBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.ADMINHOME,
      page: () => AdminHomePage(),
      binding: AdminHomeBinding(),
    ),
    GetPage(
      name: Routes.Deposit,
      page: () => AdminDepositPage(),
      binding: AdminDepositBinding(),
    ),
    GetPage(
      name: Routes.NEWPRODUCT,
      page: () => AdminNewProductsPage(),
      binding: AdminNewProductsBinding(),
    ),
    GetPage(
      name: Routes.NEWUSER,
      page: () => AdminNewUserPage(),
      binding: AdminNewUserBinding(),
    ),
    GetPage(
      name: Routes.ADMINBUYS,
      page: () => AdminPurchasePage(),
      binding: AdminPurchaseBinding(),
    ),
  ];
}
