// ignore_for_file: avoid_dynamic_calls

import 'package:dio/dio.dart';
import 'package:unbiased/core/core.dart';
import 'package:unbiased/utils/logger.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static const String TOP_HEADLINES = 'top-headlines';

  final Dio dio = Dio();

  ApiClient() {
    // dio.options.baseUrl = Environment.value.baseUrl!;
    dio.options.connectTimeout = const Duration(minutes: 4);
    dio.options.receiveTimeout = const Duration(minutes: 4);
    // if (Environment.value.environmentType != EnvType.PRODUCTION) {
    //   dio.interceptors.add(
    //     PrettyDioLogger(
    //       requestHeader: true,
    //       requestBody: true,
    //       responseHeader: true,
    //       responseBody: false,
    //     ),
    //   );
    // }

    // data.headers['Cookie'] = "jwt=" + AppConstants.AUTH_TOKEN;
  }

  Future<Response<Map<String, dynamic>>> post(
    String path,
    dynamic data,
  ) async {
    try {
      print("-- URL IS CALLING $path");
      print("-- METHOD POST");
      print("-- DATE $data");
      return await dio.post(path,
          data: data,
          options: Options(headers: {
            "Authorization": AppConstants.token.contains("Bearer")
                ? AppConstants.token
                : "Bearer ${AppConstants.token}"
          }));
    } on DioError catch (e) {
      Logger.write(e.message.toString());
      throw ApiException(e.response!.data["message"].toString());
    }
  }

  Future<Response<Map<String, dynamic>>> put(String path, dynamic data) async {
    print("-- URL IS CALLING $path");
    print("-- METHOD PUT");
    print("-- DATE $data");
    try {
      return await dio.put(path,
          data: data,
          options: Options(headers: {
            "Authorization": AppConstants.token.contains("Bearer")
                ? AppConstants.token
                : "Bearer ${AppConstants.token}"
          }));
    } on DioError catch (e) {
      Logger.write(e.message.toString());
      throw ApiException(e.response!.data["message"].toString());
    }
  }

  Future<Response<Map<String, dynamic>>> delete(String path) async {
    print("-- URL IS CALLING $path");
    print("-- METHOD DELETE");
    try {
      return await dio.delete(path,
          options: Options(headers: {
            "Authorization": AppConstants.token.contains("Bearer")
                ? AppConstants.token
                : "Bearer ${AppConstants.token}"
          }));
    } on DioError catch (e) {
      Logger.write(e.message.toString());
      throw ApiException(e.response!.data["message"].toString());
    }
  }

  Future<Response<Map<String, dynamic>>> get(String path) async {
    print("-- URL IS CALLING $path");
    print("-- METHOD GET");
    try {
      return await dio.get(path,
          options: Options(headers: {
            "Authorization": AppConstants.token.contains("Bearer")
                ? AppConstants.token
                : "Bearer ${AppConstants.token}"
          }));
    } on DioError catch (e) {
      Logger.write(e.message.toString());
      throw ApiException(e.response!.data["message"].toString());
    }
  }

  Future<Response<Map<String, dynamic>>> patch(
      String path, dynamic data) async {
    print("-- URL IS CALLING $path");
    print("-- METHOD PATCH");
    print("-- DATE $data");
    try {
      return await dio.patch(path,
          data: data,
          options: Options(headers: {
            "Authorization": AppConstants.token.contains("Bearer")
                ? AppConstants.token
                : "Bearer ${AppConstants.token}"
          }));
    } on DioError catch (e) {
      Logger.write(e.message.toString());
      throw ApiException(e.response!.data["message"].toString());
    }
  }
}

class MultiPartClient extends http.BaseClient {
  final http.Client _httpClient = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    request.persistentConnection = false;

    request.headers["Content-Type"] = "application/json";
    print(request.headers.toString());

    print(request.url.toString());
    // Future<http.StreamedResponse> response = _httpClient.send(request);
    // alice.onHttpClientRequest(request.)
    // debugPrint(request.url.toString());
    // alice.onHttpResponse(await http.Response.fromStream(await response));
    return _httpClient.send(request);
  }
}
