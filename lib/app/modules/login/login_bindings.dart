import 'package:get/get.dart';
import 'package:leitureca/app/data/services/login_service.dart';
import 'package:leitureca/app/modules/login/login_controller.dart';

class LoginBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<LoginController>(() => LoginController(
    LoginService()
  ));
  }
}