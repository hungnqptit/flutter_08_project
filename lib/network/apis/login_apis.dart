import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_08_project/models/login_response.dart';

// api dau tien cua toi
// tu thuo so khai
class LoginApi {
  Future<LoginResponseModel?> login(
      {required String? email, required String? password}) async {
    var headers = {
      'Content-Type': 'application/json',
      'x-api-key':
          '70acd5355eaf206e332857ab6642e9c7efebee7538c125eaf04072ed912c77c0dc180fde7d8e3b9d116b51d54d560a4bb01b6dc4592174f5ba430bdcbb2393b2'
    };
    var data = json.encode({"email": email, "password": password});
    var dio = Dio();

    try {
      var response = await dio.request(
        'https://64bc-222-252-22-27.ngrok-free.app/v1/api/shop/login',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
      if (response.statusCode == 200) {
        final loginResponse =
            LoginResponseModel.fromJson(json.encode(response.data));
        return loginResponse;
      } else {
        return Future.value(null);
      }
    } catch (e) {
      return Future.value(null);
    }
  }
}
