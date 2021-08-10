import 'package:get/get.dart';
import 'package:leitureca/app/data/models/user_model.dart';
import 'package:leitureca/app/data/services/user_service.dart';

class AdminUserController extends GetxController {
  UserService userService = UserService();

  List<UserModel> users;
  RxBool isLoading = false.obs;

AdminUserController();

  @override
    Future<void> onInit() async {
      
      getUsers();

      super.onInit();
    }

    Future<void> getUsers() async {
      isLoading.value = true;
      try{
        users = await userService.getAllUsers();
      }catch(e){
        print(e);
      }finally{
        isLoading.value = false;
        update();
      }
    }

    Future<void> searchUser(String search) async {
      isLoading.value = true;
      users = [];
      update();
      try{
        users = await userService.searchUser(search);
      }catch(e){
        print(e);
      }finally{
        isLoading.value = false;
        update();
      }
    }

}