import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/login/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: GetBuilder<LoginController>(
          init: Get.find<LoginController>(),
          builder: (_) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          // child: Image.asset(
                          //   'img/undraw_education_f8ru.png',
                          //   height: 200,
                          // ),
                          child: Container(
                            width: 300,
                            height: 100,
                            child: SvgPicture.asset('assets/img/undraw_education_f8ru.svg',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            bottom: 5,
                          ),
                          child: Center(
                              child: Text(
                            "Bem vindos ao Leitureca!",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          )),
                        ),
                        Center(
                            child: Text(
                          "Acesse agora mesmo",
                          style: TextStyle(color: Colors.grey),
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                            key: _.form,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 24),
                                  child: TextFormField(
                                    validator: (value) => _.uservalidate(),
                                    controller: _.user,
                                    decoration: InputDecoration(
                                      labelText: "Usu??rio",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.deepPurpleAccent,
                                              width: 2,
                                              style: BorderStyle.solid)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 24),
                                  child: TextFormField(
                                    obscureText: _.obscurePassword.value,
                                    validator: (value) => _.uservalidate(),
                                    keyboardType: TextInputType.text,
                                    controller: _.senha,
                                    decoration: InputDecoration(
                                      labelText: "Senha",
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          _.changeObscurePassword();
                                        },
                                        child: _.obscurePassword.value
                                            ? Icon(Icons.remove_red_eye)
                                            : Icon(Icons.remove_red_eye_outlined),
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.deepPurpleAccent,
                                              width: 2,
                                              style: BorderStyle.solid)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.deepPurpleAccent,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      width: double.infinity,
                                      child: TextButton(
                                        onPressed: () {
                                          if (_.form.currentState.validate()) {
                                            _.login();
                                          }
                                        },
                                        child: Text(
                                          "Acessar",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      )),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "N??o tem cadastro ou n??o lembra de sua senha?",
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    ));
  }
}
