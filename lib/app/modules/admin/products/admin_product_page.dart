import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/products/admin_product_controller.dart';
import 'package:leitureca/app/modules/admin/products/widgets/productTile.dart';
import 'package:leitureca/app/modules/admin/products/widgets/search_widget.dart';

class AdminProductPage extends GetView<AdminProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Produtos'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              child: SearchWidget(),
            ),
            Expanded(
              child: ListView(
                children: [
                  ProductTile(
                    "Revolução dos Bichos",
                  ),
                  ProductTile(
                    "Revolução dos Bichos",
                  ),
                  ProductTile(
                    "Revolução dos Bichos",
                  ),
                  ProductTile(
                    "Revolução dos Bichos",
                  ),
                  ProductTile(
                    "Revolução dos Bichos",
                  ),
                  ProductTile(
                    "Revolução dos Bichos",
                  ),
                  ProductTile(
                    "Revolução dos Bichos",
                  ),
                  ProductTile(
                    "Revolução dos Bichos",
                  ),
                  ProductTile(
                    "Revolução dos Bichos",
                  ),
                  ProductTile(
                    "Revolução dos Bichos",
                  ),
                  ProductTile(
                    "Revolução dos Bichos",
                  ),
                  ProductTile(
                    "Revolução dos Bichos",
                  ),
                  ProductTile(
                    "Revolução dos Bichos",
                  ),
                  ProductTile(
                    "Revolução dos Bichos",
                  ),
                  ProductTile(
                    "Revolução dos Bichos",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
