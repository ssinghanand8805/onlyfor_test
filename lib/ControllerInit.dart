import 'package:coocoo/ApiHelper/api.dart';
import 'package:coocoo/Controllers/LogInController.dart';
import 'package:get/get.dart';

Future<void>ControllerInit()async{
  Get.lazyPut(() => LogInController());
  Get.lazyPut(() => ApiClient(appBaseUrl: "http://avadhsolutions.online/"));
}