import 'package:coocoo/apiModels/LogInModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../CommonWidgets/CustomTextField.dart';
import '../Controllers/LogInController.dart';

class LogInView extends StatelessWidget{
  LogInView({Key? key}) : super(key: key);

  LogInController controller = Get.find();
  LogInModel model = LogInModel();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: LogInController(),
        builder: (_){
          controller.onInit();
          return Center(
            child: Form(
              key: _formKey,
              child: Container(
                width: Get.width * 0.7,
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.blue)
                // ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: Get.height * 0.3,),
                      Text("Hi there"),
                      Text("Log in to your dashboard"),
                      SizedBox(height: 60,),
                      CustomTextField(
                        maxWidth: Get.width,
                        onValueChanged: (val){
                        },
                        validator:  (value) {
                          if(value == null || value.isEmpty || !value.contains('@') ||
                              !value.contains('.')){
                            return 'Invalid Email';
                          }
                          return null;
                        },
                        hintText: 'Enter your email',
                        controller: controller.emailText.value,
                      ),
                      SizedBox(height: 20,),
                      CustomTextField(
                        maxWidth: Get.width,
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Enter password';
                          }
                          return null;
                        },
                        hintText: 'Enter your password',
                        controller: controller.password.value,),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigoAccent,
                            textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal)
                        ),
                          onPressed: ()async{
                            if (_formKey.currentState!.validate()) {
                              await model.onLogin(context);
                            }
                      },
                          child: SizedBox(
                              width:Get.width,
                              child: Text("Login",textAlign: TextAlign.center,)),
                      ),
                      SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.lock_outline_rounded,color: Colors.indigoAccent,),
                          SizedBox(width: 10,),
                          Text("Forgot password",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.indigoAccent
                          ),)
                        ],
                      ),
                      SizedBox(height: 55,),
                      Text("Copyright @ 2023 by Community Portal",
                      style: TextStyle(
                        fontSize: 12,
                      ),)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
