import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/data/models/product_model.dart';
import 'package:leitureca/app/modules/shopping/shopping_controller.dart';
import 'package:leitureca/app/user_controller.dart';

// ignore: must_be_immutable
class ShoppingHome extends StatelessWidget {
  ShoppingHome({Key key}) : super(key: key);
  UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){
            userController.logout();
          })
        ],
        title: Text("Lojinha"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GetBuilder<ShoppingController>(
          init: Get.find<ShoppingController>(),
          builder: (_) {
            return _.isloading ? Center(child: CircularProgressIndicator()) :
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 24, crossAxisSpacing: 24),
              itemCount: _.products.length,
              itemBuilder: (BuildContext context, int index) {
                ProductModel product = _.products[index];
                return ItemCard(productModel: product,);
              },
            );
          },
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final ProductModel productModel;
  const ItemCard({
    Key key, this.productModel, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingController>(
        init: Get.find<ShoppingController>(),
        builder: (_) {
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 1,
                    offset: Offset(3, 3),
                  ),
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 1,
                    offset: Offset(-3, -3),
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            child: Image.network(
                              productModel.urlImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(productModel.name, overflow: TextOverflow.clip,)),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text("${productModel.price} Leiturecas"),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    height: 30,
                    decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        )),
                    child: TextButton(
                      onPressed: () {
                        _.toProductPage(productModel);
                      },
                      child: Text(
                        "Comprar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
              ],
            ),
          );
        });
  }
}
