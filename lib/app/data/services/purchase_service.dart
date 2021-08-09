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

  Future<List<PurchaseModel>> getAll()async {
    QueryBuilder<ParseObject> purchases = QueryBuilder<ParseObject>(ParseObject('purchase'));
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

  Future<bool> changeStatus(String purchaseId, int status) async{
    ParseObject parseObject = ParseObject('purchase')
    ..objectId = purchaseId;
    if(status == 1){
         parseObject.set('status', 2);
       }else{
         parseObject.set('status', 1);
       }
    


    ParseResponse parseResponse = await parseObject.save();

    if(parseResponse.success){
      
      return true;
    }else{
      print(parseResponse.error.message);
      return false;
    }
  }
}