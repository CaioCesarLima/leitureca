import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/product/product_controller.dart';

class ProductPage extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    final ProductController controller = ProductController();
    return Scaffold(
        appBar: AppBar(
          title: Text('Título do Livro'),
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
                  "https://images-na.ssl-images-amazon.com/images/I/612QiXA+FyL.jpg"),
            ),
            Container(
              margin: EdgeInsets.all(24),
              child: Center(
                child: Container(
                  child: Text(
                    "Titulo do livro",
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
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis semper vitae nunc a pulvinar. Pellentesque a sagittis ipsum.",
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
                    "10 Leiturecas",
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
        ));
  }
}
