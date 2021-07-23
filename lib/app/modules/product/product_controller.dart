import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/data/services/product_service.dart';

class ProductController extends GetxController {
  ProductService productService = ProductService();
  ProductController();

  @override
    void onReady() async{
      // TODO: implement onReady
      await productService.getAll();
      super.onReady();
    }

  void buyProduct() {
    Get.back();
    Get.rawSnackbar(
      messageText: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Compra realizada com sucesso",
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
