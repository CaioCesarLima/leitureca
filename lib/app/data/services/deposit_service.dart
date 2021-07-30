import 'package:parse_server_sdk/parse_server_sdk.dart';

class DepositService {
  Future<bool> realizarDeposito(String id, int valor) async {
    ParseObject user = ParseUser.forQuery()
    ..objectId = id
    ..set('saldo', valor);

    ParseResponse response = await user.save();
    if(response.success){
      return true;
    }else{
      Future.error(response.error);
    }
  }
}