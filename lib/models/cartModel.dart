class CartModel {
  late String cartId;
  late String cartImage;
  late int cartPrice;
  late int cartQuantity;
  late int totalPrice;

  CartModel({
    required this.cartId,
    required this.cartImage,
    required this.cartPrice,
    required this.cartQuantity,
    required this.totalPrice,
  });
  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        cartId: json["cartId"],
        cartImage: json["cartImage"],
        cartPrice: json["cartPrice"],
        cartQuantity: json["cartQuantity"],
        totalPrice: json["totalPrice"],
      );
}
