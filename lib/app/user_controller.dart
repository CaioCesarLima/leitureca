import 'package:get/get.dart';
import 'package:leitureca/app/data/models/user_model.dart';
import 'package:leitureca/app/data/providers/user_provider.dart';
import 'package:leitureca/app/routes/app_pages.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class UserController extends GetxController {

UserController();

  UserModel user;

  @override
    void onInit() async{
      //user = await UserProvider().islogged();
      super.onInit();
    }

  logout() async{
   ParseUser userlogged = await ParseUser.currentUser();
   ParseResponse response = await userlogged.logout();
   if(response.success){
     user = null;
     Get.offAllNamed(Routes.LOGIN);
   }
  }

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}