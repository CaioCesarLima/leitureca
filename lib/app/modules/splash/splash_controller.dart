import 'package:get/get.dart';
import 'package:leitureca/app/data/models/user_model.dart';
import 'package:leitureca/app/data/providers/user_provider.dart';
import 'package:leitureca/app/routes/app_pages.dart';
import 'package:leitureca/app/user_controller.dart';

class SplashController extends GetxController {
  UserProvider userProvider = UserProvider();

SplashController();

  @override
    void onReady() {
      print('splash');
      checkUserLogged();  
      
      super.onReady();
    }
  void checkUserLogged()async{
    //UserModel islogged = await userProvider.islogged();
    // Get.find<UserController>().user = islogged;
    // if(islogged != null){
    //   Get.offNamed(Routes.HOME);
    // } else{
    //   Get.offNamed(Routes.ADMINHOME);
    // }
    Get.offNamed(Routes.ADMINHOME);
  }
}