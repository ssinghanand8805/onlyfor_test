

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../ApiHelper/popular_product_repo.dart';
import '../Controllers/LogInController.dart';

class LogInModel{
  ApiRespository apidata = Get.put(ApiRespository(apiClient: Get.find()));
  LogInController controller = Get.find();
  onLogin(context) async {
      var body = {
        "email":controller.emailText.value.text.toString(),
        "password":controller.password.value.text.toString()
      };
      print("--- BODY---- "+body.toString());
      Response data = await apidata.postApiCallByJson(
          "api/login", body);
      print("DATA : "+ data.body.toString());
      if(data.body['status'] == false){
        Fluttertoast.showToast(msg: data.body['message']);
      }
      else{
        Fluttertoast.showToast(msg: data.body['message']);
      }
    }
  }
