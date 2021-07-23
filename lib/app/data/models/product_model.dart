class ProductModel {
  final String id;
  final int price;
  final String urlImage;
  final String name;
  final int amount;
  final String description;

  ProductModel({this.price, this.urlImage, this.name, this.amount, this.description, this.id});

  factory ProductModel.fromParse(parseresponse){
    return ProductModel(
      price : parseresponse['price'],
      id : parseresponse['objectId'],
      urlImage : parseresponse['url_image'],
      amount : parseresponse['amount'],
      name : parseresponse['name'],
      description : parseresponse['description'],
    );
  }

}