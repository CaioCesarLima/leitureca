import 'package:get/get.dart';
import 'package:leitureca/app/data/models/purchase_model.dart';
import 'package:leitureca/app/data/services/purchase_service.dart';

class PurchaseController extends GetxController {
  PurchaseService purchaseService = PurchaseService();
  PurchaseController();

   @override
  void onReady() async {
    getPurchases();
    super.onReady();
  }

  RxBool isLoading = false.obs;
  List<PurchaseModel> purchases = []; 
  Future<void> getPurchases()async {
    isLoading.value = true;
    update();
    try{
      var response = await purchaseService.getByUser();
      purchases = response;
    }catch(e){
      print(e.toString());
    }finally{
      isLoading.value = false;
      update();
    }
  }

}