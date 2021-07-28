import 'package:get/get.dart';

class AdminHomeController extends GetxController {

AdminHomeController();

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}