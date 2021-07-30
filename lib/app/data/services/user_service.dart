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
}