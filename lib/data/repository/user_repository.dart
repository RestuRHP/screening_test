import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:sm_test/data/model/user/user_model.dart';
import 'package:sm_test/data/network/movie/user_api.dart';

abstract class UserRepository {
  Future<UserResponse?> getUsers();

}

class UserRepositoryImpl implements UserRepository {
  final UserApi movieApi;

  UserRepositoryImpl({required this.movieApi});

  @override
  Future<UserResponse?> getUsers() async {
    try {
      HttpResponse res = await movieApi.getUsers();
      if(res.response.statusCode==200){
        UserResponse? movie = UserResponse.fromJson(res.response.data);
        return movie;
      }
      return null;
    } on DioError catch (_) {
      return null;
    }
  }

}
