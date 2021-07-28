import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/products/admin_products_controller.dart';

class AdminProductsPage extends GetView<AdminProductsController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('AdminProductsPage')),

    body: SafeArea(
      child: Text('AdminProductsController'))
    );
  }
}