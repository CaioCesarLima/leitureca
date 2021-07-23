import 'package:leitureca/app/data/models/user_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class LoginService {
  
  Future<UserModel> login(String usercod, String senha) async {
    ParseUser user = ParseUser(usercod, senha, null);

    ParseResponse response = await user.login();

    if(response.success){
      return UserModel.fromParse(response.result);
    }else{
      return null;
    }
  }
}