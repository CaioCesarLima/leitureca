import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/deposit/admin_deposit_controller.dart';

class AdminDepositListPage extends GetView<AdminDepositController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('AdminDepositListPage')),
        body: SafeArea(child: Text('AdminDepositListController')));
  }
}
