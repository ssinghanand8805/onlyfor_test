
import 'package:coocoo/ApiHelper/popular_product_repo.dart';
import 'package:get/get.dart';



import 'api.dart';


Future<void> init()async {
  //apiClient
  Get.lazyPut(()=>ApiClient(appBaseUrl: "http://avadhsolutions.online/"),fenix: true);

  //repose
  Get.lazyPut(()=>ApiRespository(apiClient: Get.find()));

 // Get.lazyPut(()=>LoginController(popularProductRepo: Get.find()));


}
