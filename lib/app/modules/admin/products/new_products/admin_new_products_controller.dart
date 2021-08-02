import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/data/services/product_service.dart';

class AdminNewProductsController extends GetxController {
  ProductService productService = ProductService();

AdminNewProductsController();

  TextEditingController nameProductController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  RxBool isLoading= false.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  String validateName() {
    if (nameProductController.text.length > 0) {
      return null;
    } else {
      return 'O Nome precisa ser preenchido';
    }
  }

  String validateDescription() {
    if (descriptionController.text.length > 0) {
      return null;
    } else {
      return 'A descrição precisa ser preenchido';
    }
  }


  String validateAmount() {
    if (amountController.text.isEmpty) {
      return 'A Quantidade precisa ser preenchida';
    } else if (int.tryParse(amountController.text) == null) {
      return 'Digite apenas números';
    } else {
      return null;
    }
  }
  String validatePrice() {
    if (priceController.text.isEmpty) {
      return 'O Valor precisa ser preenchida';
    } else if (int.tryParse(priceController.text) == null) {
      return 'Digite apenas números';
    } else {
      return null;
    }
  }


  void cadastrar()async {
    isLoading.value = true;
    try{
      bool response = await productService.createProduct(nameProductController.text, descriptionController.text, int.parse(priceController.text), int.parse(amountController.text));
      if(response){
        Get.snackbar("Feito!", 'Produto Cadastrado com sucesso', snackPosition: SnackPosition.BOTTOM);
      }
    }catch(e){
      Get.snackbar("Ops...", e.message, snackPosition: SnackPosition.BOTTOM);
    }finally{
      isLoading.value = false;
    }
  }

}