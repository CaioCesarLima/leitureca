import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/users/admin_user_controller.dart';
import 'package:leitureca/app/modules/admin/users/widgets/search_widget.dart';
import 'package:leitureca/app/modules/admin/users/widgets/userTile.dart';

class AdminUserPage extends GetView<AdminUserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Usuários'),
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
                  UserTile("Caio Cesar", "32"),
                  UserTile("Caio Cesar", "32"),
                  UserTile("Caio Cesar", "32"),
                  UserTile("Caio Cesar", "32"),
                  UserTile("Caio Cesar", "32"),
                  UserTile("Caio Cesar", "32"),
                  UserTile("Caio Cesar", "32"),
                  UserTile("Caio Cesar", "32"),
                  UserTile("Caio Cesar", "32"),
                  UserTile("Caio Cesar", "32"),
                  UserTile("Caio Cesar", "32"),
                  UserTile("Caio Cesar", "32"),
                  UserTile("Caio Cesar", "32"),
                  UserTile("Caio Cesar", "32"),
                  UserTile("Caio Cesar", "32"),
                  UserTile("Caio Cesar", "32"),
                  UserTile("Caio Cesar", "32"),
                  UserTile("Caio Cesar", "32"),
                  UserTile("Caio Cesar", "32"),
                  UserTile("Caio Cesar", "32"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
