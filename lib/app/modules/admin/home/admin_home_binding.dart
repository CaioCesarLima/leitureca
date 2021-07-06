import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/home/admin_home_controller.dart';

class AdminHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminHomeController>(() => AdminHomeController());
  }
}
