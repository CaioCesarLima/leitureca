import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/data/models/product_model.dart';
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
    ParseUser parseUser = await ParseUser.currentUser();
    ParseObject productObject = ParseObject('Product')..set('objectId', productModel.id);
    if (userController.user.saldo > productModel.price) {
      ParseObject purchase = ParseObject('purchase')
        ..set('productID', productObject)
        ..set('userID', parseUser)
        ..set('date', DateTime(now.year, now.month, now.day))
        ..set('status', 1);
      try {
        ParseResponse response = await purchase.save();
        if (response.success) {
          int newSaldo = userController.user.saldo - productModel.price; 
          final ParseCloudFunction function = ParseCloudFunction('editUserProperty');
          final Map<String, dynamic> params = <String, dynamic>{
            'objectId': userController.user.id,
            'newSaldo': newSaldo
          };
          final ParseResponse parseResponse =
              await function.execute(parameters: params);
          
          // ParseObject userParse = ParseUser.forQuery()
          // ..objectId = userID
          // ..set('saldo', newSaldo);

          // ParseResponse userResponse = await userParse.save();
            if(parseResponse.success){
              print(parseResponse.result);
            }else{
              print(parseResponse.error);
            }

          ParseObject productParse = ParseObject('Product')
          ..objectId = productModel.id
          ..set('amount', productModel.amount - 1);

          productParse.save();

          print(response.result);
          purchaseDone("Compra Realizada com Sucesso!");
          userController.user.saldo = newSaldo;
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
