import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/users/admin_user_controller.dart';

class AdminUserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminUserController>(() => AdminUserController());
  }
}
