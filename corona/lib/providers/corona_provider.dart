import 'package:crnr/models/corona.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coronaprovider = FutureProvider((ref) => CoronaProvider().getData());

class CoronaProvider {
  Future<List<Corona>> getData() async {
    final dio = Dio();
    try {
      final response = await dio.get('https://corona.askbhunte.com/api/v1/news',
          queryParameters: {'type': 'MOHP'},
          options: Options(headers: {'Content-Type': 'application/json'}));

      List<Corona> newData = (response.data['data'] as List).map((e) {
        return Corona.fromJson(e);
      }).toList();
      // State = newData;
    } on DioError catch (e) {
      print(e);
      throw e;
    }
  }
}
