class CartModel {
  late String cartId;
  String productId;
  late int cartPrice;
  late int cartQuantity;
  late int totalPrice;
  late String cartName;
  late String cartImage;

  CartModel({
    required this.cartId,
    required this.cartPrice,
    required this.cartQuantity,
    required this.totalPrice,
    required this.productId,
    required this.cartName,
    required this.cartImage,
  });
  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        cartId: json["cartId"],
        cartPrice: json["cartPrice"],
        cartQuantity: json["cartQuantity"],
        totalPrice: json["totalPrice"],
        productId: json["productId"],
        cartName: json["cartName"],
        cartImage: json["cartImage"],
      );
}
