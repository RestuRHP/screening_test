import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../app/config/api_config.dart';

class RestClient {

  late Dio dio;

  void initializeDio() async {
    dio = Dio(BaseOptions(
      baseUrl: APIConfig.baseUrl,
      receiveTimeout: 30000,
      validateStatus: (code) => code! <= 500,
      headers: {
        'Content-type': APIConfig.contentType,
      },
    ));

    if( !kReleaseMode ) {
      dio.interceptors.add(PrettyDioLogger(
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