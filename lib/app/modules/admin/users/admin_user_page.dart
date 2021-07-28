import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/users/admin_user_controller.dart';

class AdminUserPage extends GetView<AdminUserController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('AdminUserPage')),

    body: SafeArea(
      child: Text('AdminUserController'))
    );
  }
}