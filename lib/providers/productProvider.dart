import 'package:bookshop/models/productModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postProvider =
    StreamProvider.autoDispose((ref) => ProductProvider().getData());
final imageStream =
    StreamProvider.autoDispose((ref) => ProductProvider().getData());

class ProductProvider {
  CollectionReference dbUser = FirebaseFirestore.instance.collection('books');

  Stream<List<ProductModel>> getData() {
    CollectionReference dbPosts =
        FirebaseFirestore.instance.collection('books');
    return dbPosts.snapshots().map((event) => getPostsData(event));
  }

  List<ProductModel> getPostsData(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((e) {
      final json = e.data() as Map<String, dynamic>;
      return ProductModel(
          productName: json["productName"],
          productImage: json["productImage"],
          productPrice: json["price"]);
    }).toList();
  }
}
