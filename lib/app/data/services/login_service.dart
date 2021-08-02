
import 'package:parse_server_sdk/parse_server_sdk.dart';

class LoginService {
  
  Future<ParseResponse> login(String usercod, String senha) async {
    ParseUser user = ParseUser(usercod, senha, null);

    ParseResponse response = await user.login();

    if(response.success || response.result != null){
      ParseUser logged = await ParseUser.currentUser();
      ParseResponse responseServer = await ParseUser.getCurrentUserFromServer(logged.sessionToken);
      print('userserver' + responseServer.result.toString());
      return responseServer;
    }else{
      return response;
    }
  }
}
