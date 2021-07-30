import 'package:get/get.dart';
import 'package:leitureca/app/data/models/product_model.dart';
import 'package:leitureca/app/data/services/product_service.dart';

class AdminProductsController extends GetxController {
  ProductService productService = ProductService();

  AdminProductsController();
  List<ProductModel> products;
  RxBool isLoading = false.obs;
  @override
  void onInit() async {
    isLoading.value = true;
    try {
      products = await productService.getAll();
      isLoading.value = false;
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
    // TODO: implement onInit
    super.onInit();
  }

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
