import 'package:get/get.dart';

class AdminProductsController extends GetxController {

AdminProductsController();

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}