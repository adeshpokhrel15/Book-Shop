import 'package:dio/dio.dart';
import 'package:ecommerce/api.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final productProvider = FutureProvider((ref) => ProductProvider().getData());

class ProductProvider {
  Future<List<Product>> getData() async {
    final dio = Dio();
    try {
      final response = await dio.get(Api.baseUrl);
      final data =
          (response.data as List).map((e) => Product.fromJson(e)).toList();
      return data;
    } on DioError catch (e) {
      print(e);
      throw e;
    }
  }
   Future<List<Product>> addProduct({required String product_name, required String product_details, required int price, required XFile file}) async {
    final dio = Dio();
    try {


      FormData formData = FormData.fromMap({
        'product_name': 'product_name',
        'product_price': 'product_price',
        'product_description': 'product_description',
        'product_image': 'product_image',
        'photo' : await 

      })
      final response = await dio.post(Api.addProduct);
      
     
      return 'success';
    } on DioError catch (e) {
      print(e);
      throw e;
    }
  }


}
