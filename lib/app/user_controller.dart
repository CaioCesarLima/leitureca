import 'package:get/get.dart';
import 'package:leitureca/app/data/models/user_model.dart';
import 'package:leitureca/app/data/providers/user_provider.dart';

class UserController extends GetxController {

UserController();

  UserModel user;

  @override
    void onInit() async{
      user = await UserProvider().islogged();
      super.onInit();
    }

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}