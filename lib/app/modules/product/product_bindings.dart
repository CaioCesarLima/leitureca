import 'package:get/get.dart';
import 'package:leitureca/app/modules/product/product_controller.dart';

class ProductBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ProductController>(() => ProductController());
  }
}