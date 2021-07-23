import 'package:get/get.dart';
import 'package:leitureca/app/data/models/product_model.dart';
import 'package:leitureca/app/data/services/product_service.dart';
import 'package:leitureca/app/routes/app_pages.dart';

class ShoppingController extends GetxController {
  ProductService productService = ProductService();
  ShoppingController();

  List<ProductModel> products;
  bool isloading = false;
  @override
    void onInit() async{
      // TODO: implement onInit
      isloading = true;
      products = await productService.getAll();
      isloading = false;
      update();
      super.onInit();
    }

  void toProductPage(String id) {
    Get.toNamed(Routes.PRODUCT);
  }

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
