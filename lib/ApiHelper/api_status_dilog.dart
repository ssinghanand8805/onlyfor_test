import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class ApiStatusChecker {
  final int response;
  String? errorText = "";

  ApiStatusChecker({
    required this.response,
    this.errorText,
  });

  show() {
    if (response == 404) {
      Get.back();
      dialog('Request not found');
    } else if (response == 400) {
      Get.back();
      dialog('Our Server are busy ! Please try after sometime');
    } else if (response == 401) {
      Get.back();
      dialog('Unauthorized request ! Please try after sometime');
    } else if (response == 403) {
      Get.back();
      dialog('Our Server are busy ! Please try after sometime');
    } else if (response == 500) {
      Get.back();
      dialog('Our Server are busy ! Please try after sometime');
    } else {
      Get.back();
      FetchDataException(
          'Error occurred while communication with server' ' with status code : ${response}');
      // if(errorText!.contains("SocketException")){
      //   dialog("No Internet Connection ! Please check your connection");
      // }

    }
  }

  dialog(String middleText) {
    Get.back();
    Get.defaultDialog(
      title: "",
      middleText: middleText,
    );
  }
}



class FetchDataException extends NetworkException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends NetworkException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends NetworkException {
  UnauthorisedException([message]) : super(message, "Unauthorised Request: ");
}

class NetworkException implements Exception {
  final _message;
  final _prefix;

  NetworkException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}
