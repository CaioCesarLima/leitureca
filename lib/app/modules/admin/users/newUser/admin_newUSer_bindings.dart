import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/users/newUser/admin_newUser_controller.dart';

class AdminNewUserBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<AdminNewUserController>(() => AdminNewUserController());
  }
}