import 'package:get/get.dart';
import 'package:leitureca/app/modules/purchase/purchase_controller.dart';

class PurchaseBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<PurchaseController>(() => PurchaseController());
  }
}