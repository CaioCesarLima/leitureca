import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/home/admin_home_bindings.dart';
import 'package:leitureca/app/modules/admin/home/admin_home_page.dart';
import 'package:leitureca/app/modules/home/home_binding.dart';
import 'package:leitureca/app/modules/home/home_page.dart';
import 'package:leitureca/app/modules/login/login_bindings.dart';
import 'package:leitureca/app/modules/login/login_page.dart';
import 'package:leitureca/app/modules/product/product_page.dart';
import 'package:leitureca/app/modules/splash/splash_bindings.dart';
import 'package:leitureca/app/modules/splash/splash_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL, page: () => SplashPage(), binding: SplashBinding(),),
    GetPage(
      name: Routes.PRODUCT,
      page: () => ProductPage(),
    ),
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding(),),
    GetPage(name: Routes.LOGIN, page: () => LoginPage(), binding: LoginBinding(),),
    
    GetPage(name: Routes.ADMINHOME, page: () => AdminHomePage(), binding: AdminHomeBinding(),),
  ];
}
