import 'package:get/get.dart';
import 'package:leitureca/app/routes/app_pages.dart';

class ShoppingController extends GetxController {
  ShoppingController();

  void toProductPage(String id) {
    Get.toNamed(Routes.PRODUCT);
  }

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
