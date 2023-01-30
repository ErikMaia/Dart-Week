import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:dw9_delivery_app/App/Core/config/env.dart';

class CustonDio extends DioForNative{
  CustonDio():super(
    BaseOptions(
      baseUrl: Env.instance['backend_base_url']??"",
      connectTimeout: 5000,
      receiveTimeout: 60000
    )){
      interceptors.add(LogInterceptor(requestBody: true, responseBody: true,responseHeader: true));
    }
  CustonDio auth(){
    return this;
  }
  CustonDio unauth(){
    return this;
  }
}