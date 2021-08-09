import 'package:leitureca/app/data/models/purchase_model.dart';
import 'package:leitureca/app/data/models/user_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class PurchaseService {
  Future<List<PurchaseModel>> getByUser()async{
   ParseUser parseUser = await ParseUser.currentUser();
    QueryBuilder<ParseObject> purchases = QueryBuilder<ParseObject>(ParseObject('purchase'));
    purchases.whereEqualTo('userID', parseUser);
    purchases.includeObject(['userID', 'productID']);
    ParseResponse parseResponse = await purchases.query();

    if(parseResponse.success){
      
      return (parseResponse.results.map((element) { 
        print(element['satus']);
        return PurchaseModel.fromParse(element);})).toList();
    }else{
      return Future.error(parseResponse.error);
    }
  }
}