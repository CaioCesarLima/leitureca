import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/purchase/admin_purchase_controller.dart';

class AdminPurchasePage extends GetView<AdminPurchaseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Compras'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(index.toString()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget ListTilePurchase(){
  return ListTile(
    title: Text("data"),
  );
}