import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/data/services/user_service.dart';
import 'package:leitureca/utils/parse_errors.dart';

class AdminNewUserController extends GetxController {
  UserService userService = UserService();

  AdminNewUserController();
  
  TextEditingController userNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController turmaController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  RxBool isLoading= false.obs;
  RxBool _isAdmin = false.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  String validateName() {
    if (nameController.text.length > 0) {
      return null;
    } else {
      return 'O Nome precisa ser preenchido';
    }
  }

  String validateUserName() {
    if (userNameController.text.length > 0) {
      return null;
    } else {
      return 'O Login precisa ser preenchido';
    }
  }

  String validatePassword() {
    if (passwordController.text.length >= 6) {
      return null;
    } else {
      return 'A Senha precisa ter pelo menos 6';
    }
  }

  String validateTurma() {
    if (turmaController.text.isEmpty) {
      return 'A Turma precisa ser preenchida';
    } else if (int.tryParse(turmaController.text) == null) {
      return 'Digite apenas números';
    } else {
      return null;
    }
  }

  void setIsAdmin() {
    _isAdmin.value = !_isAdmin.value;
    update();
  }

  get isAdmin => this._isAdmin.value;

  void cadastrar()async {
    isLoading.value = true;
    update();
    try{
      bool response = await userService.createUser(userNameController.text, passwordController.text, turmaController.text, nameController.text, isAdmin);
      if(response){
        Get.snackbar('Feito!', 'Cadastro realizado com sucesso', snackPosition: SnackPosition.BOTTOM);
      }
    }catch(e){
      Get.snackbar('Ops..', ParseErrors.getDescription(e.code), snackPosition: SnackPosition.BOTTOM);
    }finally{
      isLoading.value = false;
      update();
    }
    print("Cadastrar");
  }

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
