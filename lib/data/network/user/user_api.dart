import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sm_test/data/model/user/user_model.dart';

import '../../../app/config/api_config.dart';

part 'user_api.g.dart';

@RestApi(baseUrl: APIConfig.baseUrl)
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  @GET('users?per_page=20')
  Future<HttpResponse<UserResponse>> getUsers();

}
