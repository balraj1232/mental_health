import 'package:flutter/material.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:mental_health/data/api/ApiEndPoint.dart';
import 'package:mental_health/models/VerifyOtpModal.dart';
import 'package:dio/dio.dart';


class SendOtptoPhone extends BaseRepository {


/*  // BuildContext context;
  Future<SendOtp> sendOtp(
      {String phone,
        BuildContext context,
       }) async {
    ApiResponse apiResponse =
    await apiHitter.getPostApiResponse(ApiEndpoint.sendOtp,
        context: context,
        data: {
          "phone ": phone,
        }, headers: {
        'Content-Type': 'application/json',
      },
     );
    {
      try {
        if (apiResponse.status) {
          final passEntity =
          SendOtp.fromJson(apiResponse.response.data);
          return passEntity;
        } else {
          return SendOtp(meta: apiResponse.response.data);
        }
      } catch (error, stacktrace) {}
    }
  }*/
}

class VerifyOtpRepo extends BaseRepository {
  // BuildContext context;
  Future<VerifyOtpModal> verifyOtp({String phone,String otp,
    BuildContext context,
  }) async {
    final uri = '${ApiEndpoint.BaseUrl}verifyotp';
    var response = await Dio().get(uri,
        queryParameters:
        {'phone': phone, 'otp': otp},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
          followRedirects: false,
        ));
    try {
      if (response.data != null) {
        final passEntity = VerifyOtpModal.fromJson(response.data);
        return passEntity;
      } else {
        return VerifyOtpModal(meta: response.data);
      }
    } catch (error, stacktrace) {}
  }
}
