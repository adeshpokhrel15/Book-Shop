class Product {
  late String id;
  late String product_name;
  late String product_detail;
  late int price;
  late String image;

  Product(
      {required this.price,
      required this.id,
      required this.product_detail,
      required this.product_name,
      required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      price: json['price'],
      id: json['_id'],
      product_detail: json['product_detail'],
      product_name: json['product_name'],
      image: json['image'],
    );
  }
}
