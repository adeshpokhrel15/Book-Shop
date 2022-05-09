import 'package:bookshop/models/productModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postProvider =
    StreamProvider.autoDispose((ref) => ProductProvider().getData());
final postStream =
    StreamProvider.autoDispose((ref) => ProductProvider().getData());

class ProductProvider {
  CollectionReference dbPosts = FirebaseFirestore.instance.collection('books');
  Stream<List<ProductModel>> getData() {
    final data = dbPosts.snapshots().map((event) => _getFromSnap(event));

    return data;
  }

  List<ProductModel> _getFromSnap(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((e) {
      final data = e.data() as Map<String, dynamic>;
      return ProductModel(
        productImage: data['productImage'],
        productName: data['productName'],
        productPrice: data['productPrice'],
      );
    }).toList();
  }
}
