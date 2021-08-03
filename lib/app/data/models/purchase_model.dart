import 'package:leitureca/app/data/models/product_model.dart';
import 'package:leitureca/app/data/models/user_model.dart';

class PurchaseModel{
  final String id;
  final String status;
  final ProductModel purchaseProduct;
  final UserModel purchaseUser;

  PurchaseModel({this.id, this.status, this.purchaseProduct, this.purchaseUser});

  factory PurchaseModel.fromParse(response){
    return PurchaseModel(
    status : response['status'],
    purchaseProduct : response['productID'],
    purchaseUser : response['productID'],
    id: response['objectId'],
    );
  }

}