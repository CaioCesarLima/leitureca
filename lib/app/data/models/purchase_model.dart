import 'package:leitureca/app/data/models/product_model.dart';
import 'package:leitureca/app/data/models/user_model.dart';

class PurchaseModel{
  final String id;
  final int status;
  final ProductModel purchaseProduct;
  final UserModel purchaseUser;

  PurchaseModel({this.id, this.status, this.purchaseProduct, this.purchaseUser});

  factory PurchaseModel.fromParse(response){
    return PurchaseModel(
    status : response['status'],
    purchaseProduct : ProductModel.fromParse(response['productID']),
    purchaseUser : UserModel.fromParse(response['productID']),
    id: response['objectId'],
    );
  }

}