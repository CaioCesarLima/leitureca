import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/products/new_products/admin_new_products_controller.dart';

class AdminNewProductsPage extends GetView<AdminNewProductsController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('Adicionar Novo Produto')),

    body: SafeArea(
          child: SingleChildScrollView(
              child: GetBuilder<AdminNewProductsController>(
            init: AdminNewProductsController(),
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
                            controller: _.nameProductController,
                            decoration: InputDecoration(
                                labelText: 'Nome do produto',
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) => _.validateDescription(),
                            controller: _.descriptionController,
                            decoration: InputDecoration(
                                labelText: 'descrição',
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) => _.validateAmount(),
                            controller: _.amountController,
                            decoration: InputDecoration(
                                labelText: 'Quantidade',
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) => _.validatePrice(),
                            controller: _.priceController,
                            decoration: InputDecoration(
                                labelText: 'Valor',
                                border: OutlineInputBorder()),
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
        )
    );
  }
}