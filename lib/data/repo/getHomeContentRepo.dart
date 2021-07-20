import 'package:flutter/material.dart';
import 'package:mental_health/UI/Home2.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:dio/dio.dart';
import 'package:mental_health/models/GetHomeContentModal.dart';
import 'package:mental_health/models/GetTherapistContentModal.dart';


class GetHomePageContentRepo extends BaseRepository {

  Future<GetHomeContentModal> getHomeContent({
    BuildContext context,
  }) async {
    final uri = 'https://yvsdncrpod.execute-api.ap-south-1.amazonaws.com/prod/therapist/home?therapist_id=${therapistId}';

    var response = await Dio().get(uri,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
    try {
      if (response.data != null) {
        final passEntity = GetHomeContentModal.fromJson(response.data);
        return passEntity;
      } else {
        return GetHomeContentModal(meta: response.data);
      }
    } catch (error, stacktrace) {}
  }
}

