import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/deposit/admin_deposit_controller.dart';

class AdminDepositPage extends GetView<AdminDepositController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Reslizar Depósito'),
        ),
        body: SafeArea(child: Text('Reslizar Depósito')));
  }
}
