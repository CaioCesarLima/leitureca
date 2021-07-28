
import 'package:leitureca/app/data/models/user_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
class UserProvider{
  

  Future<UserModel> islogged() async{

    ParseUser userlogged = await ParseUser.currentUser();

    if(userlogged != null){
      ParseResponse response = await ParseUser.getCurrentUserFromServer(userlogged.sessionToken);
      if(response.success){
        return UserModel.fromParse(response.result);
      }else{
        return Future.error(response.error);
      }
    }
    return Future.error('Erro ao carregar usuário logado');

    
  }

  // Future<bool> setUser(String token)async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   try{
  //     prefs.setString('token', token);
  //     return true;  
  //   }catch(e){
  //     return false;
  //   }
    
    
  }

