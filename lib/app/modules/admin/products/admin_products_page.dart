import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/data/models/product_model.dart';
import 'package:leitureca/app/modules/admin/products/admin_products_controller.dart';
import 'package:leitureca/app/routes/app_pages.dart';
import 'package:leitureca/app/user_controller.dart';

// ignore: must_be_immutable
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
      body: GetBuilder<AdminProductsController>(
        init: AdminProductsController(),
        initState: (_) {},
        builder: (_) {
          return Obx(() => _.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : SafeArea(
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
                                  borderSide: BorderSide(
                                      color: Colors.deepPurple, width: 1))),
                        ),
                      ),
                      _.products != null
                          ? Expanded(
                              child: ListView.builder(
                                itemCount: _.products.length,
                                itemBuilder: (BuildContext context, index) {
                                  return ListTileUser(_.products[index]);
                                },
                              ),
                            )
                          : Text("Nenhum produto encontrado"),
                    ],
                  ),
                ));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed(Routes.NEWPRODUCT);
        },
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget ListTileUser(ProductModel product) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListTile(
          leading: Image.network(
              product.urlImage),
          trailing: Icon(
            Icons.edit,
            color: Colors.deepPurple,
          ),
          title: Text(product.name),
        ),
      ),
      Divider(),
    ],
  );
}
