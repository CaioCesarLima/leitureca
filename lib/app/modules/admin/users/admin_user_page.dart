import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/data/models/user_model.dart';
import 'package:leitureca/app/modules/admin/users/admin_user_controller.dart';
import 'package:leitureca/app/routes/app_pages.dart';
import 'package:leitureca/app/user_controller.dart';

class AdminUserPage extends GetView<AdminUserController> {
  UserController userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Usuários'),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                userController.logout();
              })
        ],
      ),
      body: GetBuilder<AdminUserController>(
        init: AdminUserController(),
        initState: (_) {},
        builder: (_) {
          return _.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _.users != null
                  ? SafeArea(
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
                          Expanded(
                            child: ListView.builder(
                              itemCount: _.users.length,
                              itemBuilder: (BuildContext context, index) {
                                return ListTileUser(_.users[index]);
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : Text("Nenhum Usuário encontrado");
        },
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

Widget ListTileUser(UserModel user) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListTile(
          leading: Icon(
            Icons.edit,
            color: Colors.deepPurple,
          ),
          trailing: GestureDetector(
            onTap: (){
              Get.toNamed(Routes.Deposit, parameters: {'id': user.id, 'saldo': user.saldo.toString()});
            },
            child: Icon(
              Icons.attach_money_sharp,
              color: Colors.deepPurple,
            ),
          ),
          title: Text(user.name),
          subtitle: Text("Turma: "+user.turma),
        ),
      ),
      Divider(
        color: Colors.grey,
        height: 1,
      ),
    ],
  );
}
