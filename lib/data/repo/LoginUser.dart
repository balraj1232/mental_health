import 'package:flutter/material.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:mental_health/data/api/ApiEndPoint.dart';
import 'package:mental_health/data/api/ApiHitter.dart';
import 'package:mental_health/models/LoginUserEntity.dart';


class LoginRepo extends BaseRepository {
  // BuildContext context;
  Future<LoginUserEntity> loginuser(
      {String email,
      BuildContext context,
      String password,
      String deviceToken,
      String username}) async {
    ApiResponse apiResponse =
        await apiHitter.getPostApiResponse(ApiEndpoint.signIn,
            context: context,
            headers: {
              'Content-Type': 'application/json',
            },
            data: email != null && email != ""
                ? {
                    "email": email,
                    "password": password,
                    "deviceToken": deviceToken,
                  }
                : {
                    "userName": username,
                    "password": password,
                    "deviceToken": deviceToken,
                  });
    {
      try {
        if (apiResponse.status) {
          final passEntity =
              LoginUserEntity.fromJson(apiResponse.response.data);
          return passEntity;
        } else {
          return LoginUserEntity(message: apiResponse.msg);
        }
      } catch (error, stacktrace) {}
    }
  }
}
