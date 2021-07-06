import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/deposit/admin_deposit_page.dart';
import 'package:leitureca/app/modules/admin/home/admin_home_page.dart';
import 'package:leitureca/app/modules/home/home_binding.dart';
import 'package:leitureca/app/modules/home/home_page.dart';
import 'package:leitureca/app/modules/product/product_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.PRODUCT,
      page: () => ProductPage(),
    ),
    GetPage(
      name: Routes.DEPOSIT,
      page: () => AdminDepositPage(),
    ),
    GetPage(
      name: Routes.HOMEADMIN,
      page: () => AdminHomePage(),
    ),
  ];
}
