import 'package:leitureca/app/data/models/product_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ProductService {
  
  Future<List<ProductModel>> getAll() async {
    var apiResponse = await ParseObject('Product').getAll();

    if(apiResponse.success){
      print(apiResponse.results);
      return (apiResponse.results.map((element) { return ProductModel.fromParse(element);})).toList();
    }else{
      return Future.error(apiResponse.error);
    }

  }

  // ignore: missing_return
  Future<ProductModel> getById(String id) async{
    ParseResponse apiResponse = await ParseObject('Product').getObject(id);
    if(apiResponse.success){
      print(apiResponse.results);
      return ProductModel.fromParse(apiResponse.result);
    }
  }

  Future<bool> createProduct(String name, String description, int price, int amount)async{
    ParseObject newProduct = ParseObject('Product')
    ..set('name', name)
    ..set('price', price)
    ..set('amount', amount)
    ..set('description', description);

    ParseResponse response = await newProduct.save();

    if(response.success){
      return true;
    }else{
      return Future.error(response.error);
    }
  }
}