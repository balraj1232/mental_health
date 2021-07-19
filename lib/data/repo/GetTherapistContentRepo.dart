import 'package:flutter/material.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:dio/dio.dart';
import 'package:mental_health/models/GetTherapistContentModal.dart';


class GetTherapistContentRepo extends BaseRepository {

  Future<GetTherapistContentModal> getContent({String therapistId,
    BuildContext context,
  }) async {
    final uri = 'https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/therapist/training?therapist_id=5sbp4';
    var response = await Dio().get(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
    try {
      if (response.data != null) {
        final passEntity = GetTherapistContentModal.fromJson(response.data);
        return passEntity;
      } else {
        return GetTherapistContentModal(meta: response.data);
      }
    } catch (error, stacktrace) {}
  }
}

