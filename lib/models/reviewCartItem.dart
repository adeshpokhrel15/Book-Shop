// class CartItem {
//   late String id;
//   late String image;
//   late String name;
//   late int price;
//   late int quantity;

//   CartItem({
//     required this.id,
//     required this.image,
//     required this.name,
//     required this.price,
//     required this.quantity,
//   });
//   factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
//       id: json["id"],
//       image: json["image"],
//       name: json["name"],
//       price: json["price"],
//       quantity: json["quantity"]);
// }

class ReviewCartModel {
  late String cartId;
  late String cartImage;
  late String cartName;
  late int cartPrice;
  late int cartQuantity;
  late var cartUnit;
  ReviewCartModel({
    required this.cartId,
    required this.cartUnit,
    required this.cartImage,
    required this.cartName,
    required this.cartPrice,
    required this.cartQuantity,
  });
}
