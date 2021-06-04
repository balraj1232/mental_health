import 'package:flutter/material.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:mental_health/data/api/ApiEndPoint.dart';
import 'package:mental_health/data/api/ApiHitter.dart';
import 'package:mental_health/models/CreateCounsellorModel.dart';
import 'package:mental_health/models/sendOtpModel.dart';




import 'package:flutter/material.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:mental_health/data/api/ApiEndPoint.dart';
import 'package:mental_health/data/api/ApiHitter.dart';
import 'package:mental_health/models/CreateCounsellorModel.dart';
import 'package:mental_health/models/sendOtpModel.dart';
import 'package:dio/dio.dart';




class SendOtptoPhone extends BaseRepository {


  Future<SendOtp> sendOtp({String phone,
    BuildContext context,
  }) async {
    final uri = '${ApiEndpoint.BaseUrl}sendotp';
    var response = await Dio().get(uri,
        queryParameters:
        {'phone': phone, },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
          followRedirects: false,
        ));
    try {
      if (response.data != null) {
        final passEntity = SendOtp.fromJson(response.data);
        return passEntity;
      } else {
        return SendOtp(meta: response.data);
      }
    } catch (error, stacktrace) {}
  }
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
  Future<SendOtp> verifyOtp({String phone,
    BuildContext context,
  }) async {
    final uri = '${ApiEndpoint.BaseUrl}sendotp';
    var response = await Dio().get(uri,
        queryParameters:
        {'phone': phone, },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
          followRedirects: false,
        ));
    try {
      if (response.data != null) {
        final passEntity = SendOtp.fromJson(response.data);
        return passEntity;
      } else {
        return SendOtp(meta: response.data);
      }
    } catch (error, stacktrace) {}
  }
}
