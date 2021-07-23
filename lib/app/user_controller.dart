import 'package:get/get.dart';
import 'package:leitureca/app/data/models/user_model.dart';

class UserController extends GetxController {

UserController();

  UserModel user;

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}