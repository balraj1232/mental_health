import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mental_health/base/BaseRepository.dart';
import 'package:mental_health/data/api/ApiEndPoint.dart';
import 'package:mental_health/models/CreateCounsellorModal.dart';
import 'package:nb_utils/nb_utils.dart';


class CreateTherapistProfileRepo extends BaseRepository {

  Future<CreateTherapistProfileModal> createCounsellor(
      {File aadhar,
        BuildContext context,
        String about,
        File certificate,
        String device_id,String education,
        String email,
        String experience,String first_name,
        String gender,
        String language_ids,String last_name,
        String linkedin,
        String phone,File photo,
        String price,
        String price_3,String price_5,
        String resume,
        String topic_ids}) async {
    FormData formData = new FormData.fromMap({
      "about": about,
      "device_id":device_id ,
      "education": education,
      "email": email,
      "experience": experience,
      "first_name": first_name,
      "gender":gender ,
      "language_ids":language_ids,
      "last_name": last_name,
      "linkedin": linkedin,
      "phone":phone,
      "price": price,
      "price_3":price_3 ,
      "price_5":price_5 ,
      "resume": resume,
      "topic_ids":topic_ids
    });

    if (aadhar != null && aadhar != "") {
      var filename = aadhar.path.split('/').last;
      if (!filename.contains(".")) {
        filename = filename + ".jpg";
      }
      formData.files.add(MapEntry("aadhar",
          await MultipartFile.fromFile(aadhar.path, filename: filename)));
    }

    if (certificate != null && certificate != "") {
      var filename = certificate.path.split('/').last;
      if (!filename.contains(".")) {
        filename = filename + ".jpg";
      }
      formData.files.add(MapEntry("certificate",
          await MultipartFile.fromFile(certificate.path, filename: filename)));
    }
    if (photo != null && photo != "") {
      var filename = photo.path.split('/').last;
      if (!filename.contains(".")) {
        filename = filename + ".jpg";
      }
      formData.files.add(MapEntry("photo",
          await MultipartFile.fromFile(photo.path, filename: filename)));
    }

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          final response = await dio.post(ApiEndpoint.registerCounsellor,
              data: formData,
              );
          final passEntity = CreateTherapistProfileModal.fromJson(response.data);
          return passEntity;
        } catch (error, stacktrace) {

        }
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(
          msg: "No Internet Connection",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
