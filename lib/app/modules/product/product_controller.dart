import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductController();

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
