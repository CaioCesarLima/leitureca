import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/purchase/purchase_controller.dart';

class PurchasePage extends GetView<PurchaseController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('PurchasePage')),

    body: SafeArea(
      child: Text('PurchaseController'))
    );
  }
}