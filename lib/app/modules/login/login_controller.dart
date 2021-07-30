import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/data/models/user_model.dart';
import 'package:leitureca/app/data/providers/user_provider.dart';
import 'package:leitureca/app/data/services/login_service.dart';
import 'package:leitureca/app/routes/app_pages.dart';
import 'package:leitureca/app/user_controller.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class LoginController extends GetxController {
  final LoginService _service;
  LoginController(this._service);
  TextEditingController user = TextEditingController();
  TextEditingController senha = TextEditingController();
  GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  void onReady() async {
    UserProvider().islogged();
    super.onReady();
  }

  String uservalidate() {
    if (user.text.trim().length < 4) {
      return 'Seu Login precisa ter mais de 4 dígitos';
    }
    return null;
  }

  String passwordvalidate() {
    if (user.text.trim().length < 6) {
      return 'Sua senha precisa ter mais de 6 dígitos';
    }
    return null;
  }

  void login() async {
    
      ParseResponse response = await this
          ._service
          .login(user.text.trim().toString(), senha.text.trim());
      UserController userController = Get.find<UserController>();
      if (response.success) {
        print(ParseUser.currentUser());
        userController.user = UserModel.fromParse(response.result);
        if(userController.user.isAdmin ){
          Get.offAndToNamed(Routes.ADMINHOME);
        }else{
          Get.offAndToNamed(Routes.HOME);
        }
        
      } else {
        snackbar(response.error.message);
      }
    
  }

  void snackbar(String mensagem) {
    Get.rawSnackbar(
      messageText: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              mensagem,
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 24,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.check,
              color: Colors.deepPurple,
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      snackPosition: SnackPosition.TOP,
      borderColor: Colors.deepPurple,
    );
  }

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
