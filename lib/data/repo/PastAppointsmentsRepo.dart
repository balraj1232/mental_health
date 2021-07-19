import 'package:flutter/material.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:mental_health/models/AppointmentModal.dart';
import 'package:dio/dio.dart';


class PastAppointmentsRepo extends BaseRepository {

  Future<AppointmentModal> pastAppointmentRepo({String therapistId,
    BuildContext context,
  }) async {
    final uri = 'https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/therapist/appointment/upcoming?therapist_id=5sbp4';
    var response = await Dio().get(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
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

