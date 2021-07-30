import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/products/admin_products_controller.dart';
import 'package:leitureca/app/user_controller.dart';

class AdminProductsPage extends GetView<AdminProductsController> {
  UserController userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Produtos'),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                userController.logout();
              })
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: GestureDetector(
                        onTap: () {
                          print("Busca realizada");
                        },
                        child: Icon(Icons.search),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 1))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 25,
                itemBuilder: (BuildContext context, index) {
                  return ListTileUser();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('novo usuário');
        },
      ),
    );
  }
}

Widget ListTileUser() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListTile(
          leading: Image.network('https://images-na.ssl-images-amazon.com/images/I/81D0qNDMqPL.jpg'),
          trailing: Icon(
            Icons.edit,
            color: Colors.deepPurple,
          ),
          title: Text("Revolução dos bichos"),
        ),
      ),
      Divider(),
    ],
  );
}
