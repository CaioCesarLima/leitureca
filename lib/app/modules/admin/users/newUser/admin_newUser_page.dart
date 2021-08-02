import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/users/admin_user_controller.dart';
import 'package:leitureca/app/modules/admin/users/newUser/admin_newUser_controller.dart';

class AdminNewUserPage extends GetView<AdminNewUserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Novo Usuário'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: GetBuilder<AdminNewUserController>(
            init: AdminNewUserController(),
            builder: (_) {
              return Form(
                key: _.formkey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) => _.validateName(),
                            controller: _.nameController,
                            decoration: InputDecoration(
                                labelText: 'Nome do usuário',
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) => _.validateUserName(),
                            controller: _.userNameController,
                            decoration: InputDecoration(
                                labelText: 'Login do usuário',
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) => _.validatePassword(),
                            controller: _.passwordController,
                            decoration: InputDecoration(
                                labelText: 'Senha de acesso',
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) => _.validateTurma(),
                            controller: _.turmaController,
                            decoration: InputDecoration(
                                labelText: 'Turma',
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text("Esse usuário é administrador?")),
                              Checkbox(
                                  value: _.isAdmin,
                                  onChanged: (value) => _.setIsAdmin()),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepPurple),
                          ),
                          onPressed: () {
                            if (_.formkey.currentState.validate()) {
                              _.cadastrar();
                            }
                          },
                          child: AnimatedContainer(
                            padding: EdgeInsets.all(5),
                            duration: Duration(milliseconds: 200),
                            child: _.isLoading.value
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Text(
                                    'Cadastrar',
                                    style: TextStyle(fontSize: 18),
                                  ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
        ));
  }
}
