import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/purchase/admin_purchase_controller.dart';

class AdminPurchaseBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<AdminPurchaseController>(() => AdminPurchaseController());
  }
}