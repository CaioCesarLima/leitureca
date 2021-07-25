import 'package:get/get.dart';
import 'package:leitureca/app/data/providers/user_provider.dart';
import 'package:leitureca/app/routes/app_pages.dart';

class SplashController extends GetxController {
  UserProvider userProvider = UserProvider();

SplashController();

  @override
    void onReady() {
      //checkUserLogged();  
      Future.delayed(Duration(seconds: 2)).then((value) => {
        Get.offNamed(Routes.LOGIN)
      });
      super.onReady();
    }
  // void checkUserLogged()async{
  //   bool islogged = await userProvider.islogged();
  //   if(islogged){
  //     Get.offNamed(Routes.HOME);
  //   } else{
  //     Get.offNamed(Routes.LOGIN);
  //   }
  // }
}