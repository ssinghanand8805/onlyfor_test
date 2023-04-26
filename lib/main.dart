import 'package:coocoo/view/LogInView.dart';
import 'package:coocoo/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'ControllerInit.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  ControllerInit();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'facebook_ui_flutter',
      debugShowCheckedModeBanner: false,
      home: LogInView(),
      //home: HomePage(),
    );
  }
}
