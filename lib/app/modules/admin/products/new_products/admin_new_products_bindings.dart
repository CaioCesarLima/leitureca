import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/products/new_products/admin_new_products_controller.dart';

class AdminNewProductsBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<AdminNewProductsController>(() => AdminNewProductsController());
  }
}