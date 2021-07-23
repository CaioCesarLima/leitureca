import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/user_controller.dart';

class SaldoHome extends StatelessWidget {
  SaldoHome({Key key}) : super(key: key);
  
  UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: GetBuilder<UserController>(
          init: Get.find<UserController>(),
          builder: (_) {
            return Text("${_.user.name}");
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'data:image/jpeg;base64,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',
                  height: 150,
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text("Você Possui"),
                ),
                SizedBox(
                  height: 10,
                ),
                GetBuilder<UserController>(
                  init: userController,
                  initState: (_) {},
                  builder: (_) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 150),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        '${_.user.saldo} Leiturecas',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
