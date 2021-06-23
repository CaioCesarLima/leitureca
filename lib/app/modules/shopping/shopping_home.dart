import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingHome extends StatelessWidget {
  const ShoppingHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lojinha"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 24, crossAxisSpacing: 24),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
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
                          Image.network(
                            "https://images-na.ssl-images-amazon.com/images/I/612QiXA+FyL.jpg",
                            height: 150,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: Text("Título do Livro")),
                          Text("10 Leiturecas")
                        ],
                      ),
                    ),
                  ),
                  Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Get.theme.primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                          )),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Comprar",
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
