import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce/api.dart';
import 'package:ecommerce/models/order.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderProvider = Provider((ref) => OrderProvider());
final orderHistoryProvider =
    StateNotifierProvider<OrderProvider, List<Order>>((ref) => OrderProvider());

class OrderProvider extends StateNotifier<List<Order>> {
  OrderProvider() : super([]) {
    getData();
  }
  Future<void> getData({String? token}) async {
    final dio = Dio();

    try {
      final response = await dio.post(Api.orderHistory,
          options: Options(headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          }));

      state = (response.data as List).map((e) => Order.fromJson(e)).toList();
    } on DioError catch (e) {
      print(e);
    }

    Future<String> addOrder(
        {required Order order, required String token}) async {
      final dio = Dio();

      try {
        final response = await dio.post(Api.orderCreate,
            data: {
              'dateTime': order.dateTime,
              'amout': order.amout,
              'carts': order.carts.map((e) => e.toJson()).toList(),
            },
            options: Options(headers: {
              HttpHeaders.authorizationHeader: 'Bearer $token',
            }));
        return 'success';
      } on DioError catch (e) {
        print(e);
        return '';
      }
    }
  }
}
