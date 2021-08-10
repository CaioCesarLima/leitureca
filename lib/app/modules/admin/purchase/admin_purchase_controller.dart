import 'package:get/get.dart';
import 'package:leitureca/app/data/models/purchase_model.dart';
import 'package:leitureca/app/data/services/purchase_service.dart';

class AdminPurchaseController extends GetxController {
  PurchaseService purchaseService = PurchaseService();

AdminPurchaseController();


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
      var response = await purchaseService.getAll();
      purchases = response;
    }catch(e){
      print(e.toString());
    }finally{
      isLoading.value = false;
      update();
    }
  }

  Future<void> changeStatus(int index) async {
    PurchaseModel purchase = this.purchases[index];

    try{
     bool response = await purchaseService.changeStatus(purchase.id, purchase.status);
     if(response){
       if(this.purchases[index].status == 1){
         this.purchases[index].status = 2;
       }else{
         this.purchases[index].status = 1;
       }
     }else{
       Get.snackbar('Ops..', 'Houve algum problema, tente novamente', snackPosition: SnackPosition.BOTTOM);
     }

    }catch(e){
      print(e);
    }finally{
      update();
    }
    
    
    
  }
}