import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/deposit/admin_deposit_controller.dart';

class AdminDepositBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<AdminDepositController>(() => AdminDepositController());
  }
}