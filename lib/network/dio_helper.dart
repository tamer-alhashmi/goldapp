import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
// https://www.goldapi.io/api/XAU/USD
  static init(){
dio=Dio(
  BaseOptions(
    baseUrl: 'https://www.goldapi.io/api/',
    receiveDataWhenStatusError: true,
  )
);

  }

  static Future<Response> getDate(String url){
    dio!.options.headers={
      'x-access-token':'goldapi-3p5e7rloeyxkk6-io'
    };
    return dio!.get(url);
  }
}