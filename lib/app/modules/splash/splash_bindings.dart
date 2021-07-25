import 'package:get/get.dart';
import 'package:leitureca/app/modules/splash/splash_controller.dart';

class SplashBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<SplashController>(() => SplashController());
  }
}