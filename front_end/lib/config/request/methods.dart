/*
 * -------请求简单封装-------
 * 由于所有接口是POST请求，就写死了请求方式
*/

import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'dart:async';

import 'package:the_gorgeous_login/config/request/url.dart';

class DioUtil {
  static BaseOptions options = BaseOptions(
    baseUrl: null,
    connectTimeout: 15000,
    responseType: ResponseType.plain,
    receiveTimeout: 15000,
  );

  static Dio dio = new Dio(options);

  static requestData(url, {formData}) async {
    try {
      Response response;
      if (formData == null) {
        response = await dio.post(servicePath[url]);
      } else {
        String formdata = jsonEncode(formData);
        response = await dio.post(
          servicePath[url],
          data: formdata,
        );
      }
      if (response.statusCode == 200) {
        String data = response.data;
        return jsonDecode(data);
      } else {
        throw Exception("接口异常");
      }
    } catch (e) {
      print("网络出现错误");
    }
  }
}
