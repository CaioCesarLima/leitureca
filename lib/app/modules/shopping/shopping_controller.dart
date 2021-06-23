import 'package:get/get.dart';

class ShoppingController extends GetxController {
  ShoppingController();

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
