import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/data/models/user_model.dart';
import 'package:leitureca/app/data/services/deposit_service.dart';
import 'package:leitureca/app/data/services/user_service.dart';
import 'package:leitureca/app/modules/admin/users/admin_user_controller.dart';
import 'package:leitureca/utils/parse_errors.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class AdminDepositController extends GetxController {
  UserService userService = UserService();
  DepositService depositService = DepositService();

  GlobalKey<FormState> fomrKey = GlobalKey<FormState>();
  TextEditingController valorDeposito = TextEditingController();
  AdminUserController adminUserController = Get.find<AdminUserController>();

AdminDepositController();
  RxBool isLoading = false.obs;
  String id;
  int saldo;
  UserModel user;
  @override
    void onInit() async{
      id = Get.parameters['id'];
      saldo = int.parse(Get.parameters['saldo']);
      print(id);
      
      super.onInit();
    }

  void realizarDeposito() async {
    isLoading.value = true;
    int valor = int.parse(valorDeposito.text)+saldo;
    final ParseCloudFunction function = ParseCloudFunction('editUserProperty');
    final Map<String, dynamic> params = <String, dynamic>{
      'objectId': id,
      'newSaldo': valor
    };
    final ParseResponse parseResponse =
        await function.execute(parameters: params);
    if (parseResponse.success) {
      print(parseResponse.result);
      Get.snackbar('Depósito realizado com sucesso', 'Saldo atual: $valor', snackPosition: SnackPosition.BOTTOM);
      saldo = valor;
    }else{
      print(parseResponse.error);
      Get.snackbar('Ops.', ParseErrors.getDescription(parseResponse.error.code), snackPosition: SnackPosition.BOTTOM);
    }
    
    isLoading.value = false;

  }
  String validateForm(value){
    if(value.isEmpty){
      return 'Precisa ter um valor para depósito';
    }else if(int.tryParse(value) == null){
      return 'Digite apenas números';
    }else{
      return null;
    }
  }
  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;

  
}


