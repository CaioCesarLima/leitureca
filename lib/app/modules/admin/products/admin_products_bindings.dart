import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/products/admin_products_controller.dart';

class AdminProductsBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<AdminProductsController>(() => AdminProductsController());
  }
}