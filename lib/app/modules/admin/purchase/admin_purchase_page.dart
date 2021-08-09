import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/data/models/purchase_model.dart';
import 'package:leitureca/app/modules/admin/purchase/admin_purchase_controller.dart';

class AdminPurchasePage extends GetView<AdminPurchaseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Compras'),
        ),
        body: GetBuilder<AdminPurchaseController>(
          init: AdminPurchaseController(),
          initState: (_) {},
          builder: (_) {
            return SafeArea(
                child: _.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: _.purchases.length,
                        itemBuilder: (__, index) {
                          PurchaseModel purchase = _.purchases[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                title: Text(purchase.purchaseProduct.name),
                                subtitle: Text(purchase.status == 1
                                    ? 'Compra Realizada'
                                    : 'Separado para busca'),
                                trailing: Container(
                                  child: TextButton(
                                      onPressed: () {
                                        _.changeStatus(index);
                                      },
                                      child: Text("Mudar Status")),
                                ),
                              ),
                            ),
                          );
                        }));
          },
        ));
  }
}
