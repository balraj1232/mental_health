import 'package:flutter/material.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:dio/dio.dart';
import 'package:mental_health/models/getTherapistDetailModal.dart';


class GetTherapistDetailRepo extends BaseRepository {

  Future<GetTherapistDetailModal> getTherapistDetail({String therapistId,
    BuildContext context,
  }) async {
    final uri = 'https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/therapist?therapist_id=jssg4';
    var response = await Dio().get(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
    try {
      if (response.data != null) {
        final passEntity = GetTherapistDetailModal.fromJson(response.data);
        return passEntity;
      } else {
        return GetTherapistDetailModal(meta: response.data);
      }
    } catch (error, stacktrace) {}
  }
}

