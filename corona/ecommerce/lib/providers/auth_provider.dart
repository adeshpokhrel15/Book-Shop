import 'package:dio/dio.dart';
import 'package:ecommerce/api.dart';
import 'package:ecommerce/models/users.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final authProvider = Provider((ref) => AuthProvider());

class AuthProvider {
  Future<String> signUp(
      {required String email,
      required String full_name,
      required String password}) async {
    final dio = Dio();
    try {
      final response = await dio.post(Api.userSignUp,
          data: {'email': email, 'password': password, 'full_name': full_name});
      User user = User.fromJson(response.data);
      Hive.box<User>('users').add(user);
      print(response.statusCode);
      print(response.data);
      return 'success';
    } catch (err) {
      print(err);
      return 'something went wrong';
    }
  }

  Future<String> userlogin(
      {required String email, required String password}) async {
    final dio = Dio();
    try {
      final response = await dio.post(Api.userLogin, data: {
        'email': email,
        'password': password,
      });
      User user = User.fromJson(response.data);
      Hive.box<User>('users').add(user);
      print(response.statusCode);
      print(response.data);
      return 'success';
    } catch (err) {
      print(err);
      return 'something went wrong';
    }
  }
}
