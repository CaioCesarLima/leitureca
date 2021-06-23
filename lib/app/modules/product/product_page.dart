import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/product/product_controller.dart';

class ProductPage extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Título do Livro'),
          centerTitle: true,
        ),
        body: SafeArea(child: Text('ProductController')));
  }
}
