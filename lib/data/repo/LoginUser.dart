import 'package:flutter/material.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:mental_health/data/api/ApiEndPoint.dart';
import 'package:mental_health/data/api/ApiHitter.dart';
import 'package:mental_health/models/CreateCounsellorModel.dart';

class CreateCounsellorRepo extends BaseRepository {
  // BuildContext context;
  Future<CreateCousellorModel> createCounsellor(
      {String aadhar,
      BuildContext context,
      String about,
      String certificate,
      String device_id,String education,
        String email,
        String experience,String first_name,
        String gender,
        String language_ids,String last_name,
        String linkedin,
        String phone,String photo,
        String price,
        String price_3,String price_5,
        String resume,
        String topic_ids}) async {
    ApiResponse apiResponse = await apiHitter.getPostApiResponse(
        ApiEndpoint.registerCounsellor,
        context: context,
        headers: {
          'Content-Type': 'application/json',
        },
        data: {
          "aadhar": aadhar,
          "about": about,
          "certificate":certificate ,
          "device_id":device_id ,
          "education": education,
          "email": email,
          "experience": experience,
          "first_name": first_name,
          "gender":gender ,
          "language_ids":language_ids,
          "last_name": last_name,
          "linkedin": linkedin,
          "phone":phone ,
          "photo":photo ,
          "price": price,
          "price_3":price_3 ,
          "price_5":price_5 ,
          "resume": resume,
          "topic_ids":topic_ids
        }, );
    {
      try {
        if (apiResponse.status) {
          final passEntity =
          CreateCousellorModel.fromJson(apiResponse.response.data);
          return passEntity;
        } else {
          return CreateCousellorModel(meta: apiResponse.response.data);
        }
      } catch (error, stacktrace) {}
    }
  }
}
