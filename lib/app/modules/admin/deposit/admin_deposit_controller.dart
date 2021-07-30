import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/data/models/user_model.dart';
import 'package:leitureca/app/data/services/deposit_service.dart';
import 'package:leitureca/app/data/services/user_service.dart';

class AdminDepositController extends GetxController {
  UserService userService = UserService();
  DepositService depositService = DepositService();

  GlobalKey<FormState> fomrKey = GlobalKey<FormState>();
  TextEditingController valorDeposito = TextEditingController();

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
    var response = await depositService.realizarDeposito(id, valor);
    if(response){
      Get.snackbar('Depósito realizado com sucesso', 'Saldo atual: $saldo', snackPosition: SnackPosition.BOTTOM);
    }else{
      Get.snackbar('Ops.', 'Houve algum problema no depósito, tente novamente mais tarde', snackPosition: SnackPosition.BOTTOM);
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


