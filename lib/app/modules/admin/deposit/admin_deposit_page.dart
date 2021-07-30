import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/deposit/admin_deposit_controller.dart';

class AdminDepositPage extends GetView<AdminDepositController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Reslizar Depósito'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: GetBuilder<AdminDepositController>(
            init: AdminDepositController(),
            initState: (_) {},
            builder: (_) {
              return Obx(
                () => Form(
                  key: _.fomrKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Center(
                          child: Text('Realizar Depósito'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 10,
                        ),
                        child: TextFormField(
                          validator: (value) => _.validateForm(value),
                          controller: _.valorDeposito,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Valor de depósito',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 10,
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepPurple),
                          ),
                          onPressed: () {
                            if (_.fomrKey.currentState.validate()) {
                              _.realizarDeposito();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: _.isLoading.value?Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              ),
                            ):Text(
                              "Depositar",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )),
        ),
      ),
    );
  }
}
