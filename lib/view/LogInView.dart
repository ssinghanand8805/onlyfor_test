import 'package:coocoo/apiModels/LogInModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../CommonWidgets/CustomTextField.dart';
import '../Controllers/LogInController.dart';

class LogInView extends StatelessWidget{
  LogInView({Key? key}) : super(key: key);

  LogInController controller = Get.find();
  LogInModel model = LogInModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: LogInController(),
        builder: (_){
          controller.onInit();
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Hi there"),
                Text("Log in to your dashboard"),
                SizedBox(height: 60,),
                CustomTextField(
                  hintText: 'Enter your email',
                  controller: controller.emailText.value,),
                SizedBox(height: 20,),
                CustomTextField(
                  hintText: 'Enter your password',
                  controller: controller.password.value,),
                SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: ()async{
                  await model.onLogin(context);
                }, child: Text("Login"))
              ],
            ),
          );
        },
      ),
    );
  }
}
