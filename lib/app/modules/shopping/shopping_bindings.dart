import 'package:get/get.dart';
import 'package:leitureca/app/modules/shopping/shopping_controller.dart';

class ShoppingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShoppingController>(() => ShoppingController());
  }
}
