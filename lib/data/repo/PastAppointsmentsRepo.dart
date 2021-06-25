import 'package:flutter/material.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:mental_health/data/api/ApiEndPoint.dart';
import 'package:mental_health/models/AppointmentModal.dart';
import 'package:mental_health/models/sendOtpModel.dart';
import 'package:dio/dio.dart';


class PastAppointmentsRepo extends BaseRepository {

  Future<AppointmentModal> pastAppointmentRepo({String therapistId,
    BuildContext context,
  }) async {
    final uri = '${ApiEndpoint.BaseUrl}appointment/past';
    var response = await Dio().get(uri,
        queryParameters:
        {'therapist_id ': therapistId},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
          followRedirects: false,
        ));
    try {
      if (response.data != null) {
        final passEntity = AppointmentModal.fromJson(response.data);
        return passEntity;
      } else {
        return AppointmentModal(meta: response.data);
      }
    } catch (error, stacktrace) {}
  }
}

