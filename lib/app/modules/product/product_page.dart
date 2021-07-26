import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/product/product_controller.dart';

class ProductPage extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    final ProductController controller = ProductController();
    controller.onReady();
    return Obx(()=>
    controller.isLoading.value ? Center(child: CircularProgressIndicator()) : Scaffold(
        appBar: AppBar(
          title: Text(controller.productModel.name),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 300,
              child: Image.network(
                  controller.productModel.urlImage),
            ),
            Container(
              margin: EdgeInsets.all(24),
              child: Center(
                child: Container(
                  child: Text(
                    controller.productModel.name,
                    style: TextStyle(color: Colors.black87, fontSize: 35),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(24),
              child: Center(
                child: Container(
                  width: 500,
                  child: Text(
                    controller.productModel.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(24),
              child: Center(
                child: Container(
                  child: Text(
                    "${controller.productModel.price} Leiturecas",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(24),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Get.defaultDialog(
                      title: "Deseja confirmar sua compra?",
                      middleText:
                          "O valor será descontado de seu saldo automaticamente",
                      confirm: TextButton(
                          onPressed: () {
                            controller.buyProduct();
                          },
                          child: Text("Confirmar")),
                      cancel: TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("Cancelar")),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(18),
                    width: 450,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.deepPurple,
                    ),
                    child: Center(
                        child: Text(
                      "Comprar".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    )),
                  ),
                ),
              ),
            )
          ],
        ))
    );
  }
}
