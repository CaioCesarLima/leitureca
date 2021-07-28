import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/deposit/admin_deposit_controller.dart';

class AdminDepositPage extends GetView<AdminDepositController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('AdminDepositPage')),

    body: SafeArea(
      child: Text('AdminDepositController'))
    );
  }
}