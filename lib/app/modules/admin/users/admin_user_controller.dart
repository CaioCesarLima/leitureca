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
      isLoading.value = true;
      try{
        users = await userService.getAllUsers();
      }catch(e){
        print(e);
      }finally{
        isLoading.value = false;
        update();
      }
      // TODO: implement onInit

      super.onInit();
    }

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}