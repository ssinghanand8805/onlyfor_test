import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class LogInController extends GetxController{

  Rx<TextEditingController> emailText = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;

  @override
  void onInit()async{
    // TODO: implement onInit
    super.onInit();
      print('ready in 2...');
      await Future.delayed(const Duration(seconds: 1));
      print('ready in 1...');
      await Future.delayed(const Duration(seconds: 1));
      print('go!');
      FlutterNativeSplash.remove();
  }

}