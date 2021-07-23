import 'package:leitureca/app/data/models/product_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ProductService {
  
  Future<List<ProductModel>> getAll() async {
    var apiResponse = await ParseObject('Product').getAll();

    if(apiResponse.success){
      print(apiResponse.results);
      return (apiResponse.results.map((element) { return ProductModel.fromParse(element);})).toList();
    }

  }
}