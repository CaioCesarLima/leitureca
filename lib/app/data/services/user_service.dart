import 'package:leitureca/app/data/models/user_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class UserService{
  
  Future<List<UserModel>> getAllUsers() async {
    QueryBuilder<ParseUser> queryUsers =
        QueryBuilder<ParseUser>(ParseUser.forQuery());
        queryUsers.whereNotEqualTo('isAdmin', true);
     var apiResponse = await queryUsers.query();

    if(apiResponse.success){
      print(apiResponse.results);
      return (apiResponse.results.map((element) { return UserModel.fromParse(element);})).toList();
    }else{
      return Future.error(apiResponse.error);
    }

  }

  Future<UserModel> getUSer(String id) async {
    QueryBuilder<ParseUser> queryUsers =
        QueryBuilder<ParseUser>(ParseUser.forQuery());
        queryUsers.whereEqualTo('objectId', id);
     var apiResponse = await queryUsers.query();

    if(apiResponse.success){
      print(apiResponse.results);
      return UserModel.fromParse(apiResponse.result);
    }else{
      return Future.error(apiResponse.error);
    }
  }

  Future<bool> createUser(String userName, String password, String turma, String name, bool isAdmin) async{
    ParseUser user =  ParseUser(userName, password, null)
      ..set('isAdmin', isAdmin)
      ..set('turma', turma)
      ..set('name', name);

      ParseResponse response = await user.create();

      if(response.success){
        return response.success;
      }else{
        return Future.error(response.error);
      }
  }
}