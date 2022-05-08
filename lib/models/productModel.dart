class ProductModel {
  late String productName;
  late String productImage;
  late int productPrice;

  ProductModel({
    required this.productName,
    required this.productImage,
    required this.productPrice,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      productName: json["productName"],
      productImage: json["productImage"],
      productPrice: json["price"]);
}
