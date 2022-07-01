import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpService extends GetxController{

  late Dio _dio;

  static String? _baseUrl;
  static late HttpService _instance;

  Dio get instance => _dio;

  HttpService._internal(String baseUrl){
    _baseUrl = baseUrl;
    initializeDio();
  }

  factory HttpService({required String baseUrl}){
    _instance = HttpService._internal(baseUrl);
    return _instance;
  }

  void initializeDio() async {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl ?? '',
      receiveTimeout: 30000,
      validateStatus: (code) => code! <= 500,
      headers: {
        'Accept': 'application/json'
      },
    ));

    if( !kReleaseMode ) {
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 150,
      ),
      );
    }

  }

}