import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/data/models/product_model.dart';
import 'package:leitureca/app/data/models/user_model.dart';
import 'package:leitureca/app/data/services/product_service.dart';
import 'package:leitureca/app/data/services/purchase_service.dart';
import 'package:leitureca/app/user_controller.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ProductController extends GetxController {
  ProductService productService = ProductService();
  PurchaseService purchaseService = PurchaseService();

  UserController userController;

  ProductModel productModel;
  RxBool isLoading = true.obs;
  RxBool buyLoading = false.obs;
  ProductController();

  @override
  void onReady() async {
    userController = Get.find<UserController>();
    isLoading.value = true;
    String id = Get.parameters['productId'];
    productModel = await productService.getById(id);
    isLoading.value = false;
    super.onReady();
  }

  void buyProduct() async {
    buyLoading.value = true;
    DateTime now = DateTime.now();
    String productID = productModel.id;
    String userID = userController.user.id;
    if (userController.user.saldo > productModel.price) {
      ParseObject purchase = ParseObject('purchase')
        ..set('productID', productID)
        ..set('userID', userID)
        ..set('date', DateTime(now.year, now.month, now.day))
        ..set('status', 'Compra realizada');
      try {
        ParseResponse response = await purchase.save();
        if (response.success) {
          int newSaldo = userController.user.saldo - productModel.price; 
          ParseObject userParse = ParseObject('User')
          ..objectId = userID
          ..set('saldo', newSaldo);

          ParseResponse userResponse = await userParse.save();
            if(userResponse.success){
              print(userResponse.result);
            }else{
              print(userResponse.error);
            }

          ParseObject productParse = ParseObject('Product')
          ..objectId = productID
          ..set('amount', productModel.amount - 1);

          productParse.save();

          print(response.result);
          purchaseDone("Compra Realizada com Sucesso!");
          buyLoading.value = false;
        } else {
          print(response.error);
          purchaseDone("Houve algum erro, tente novamente mais tarde!");
          buyLoading.value = false;
        }
      } catch (e) {
        purchaseDone("Houve algum erro, tente novamente mais tarde!");
        print(e);
        buyLoading.value = false;
      }
    }else{
      purchaseDone("Saldo insuficiente!");
      buyLoading.value = false;
    }
  }

  void purchaseDone(String mensagem) {
    Get.back();
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
          ],
        ),
      ),
      backgroundColor: Colors.white,
      snackPosition: SnackPosition.TOP,
      borderColor: Colors.deepPurple,
    );
  }
}
