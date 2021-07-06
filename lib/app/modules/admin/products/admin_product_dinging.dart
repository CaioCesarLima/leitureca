import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/products/admin_product_controller.dart';

class AdminProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminProductController>(() => AdminProductController());
  }
}
