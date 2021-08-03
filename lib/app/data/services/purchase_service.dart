import 'package:leitureca/app/data/models/purchase_model.dart';
import 'package:leitureca/app/data/models/user_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class PurchaseService {
  Future<List<PurchaseModel>> getByUser(UserModel user)async{
    QueryBuilder<ParseObject> purchases = QueryBuilder<ParseObject>(ParseObject('purchase'));
    purchases.whereEqualTo('userID', user.id);
    ParseResponse parseResponse = await purchases.query();

    if(parseResponse.success){
      return parseResponse.results.map((e) => PurchaseModel.fromParse(e)).toList();
    }else{
      return Future.error(parseResponse.error);
    }
  }
}