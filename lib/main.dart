import 'package:flutter/material.dart';
import 'package:flutter_app/authenticationScreen/login_screen.dart';
import 'package:flutter_app/controllers/authentication_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_app/jobMatchScreen/job_match_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AuthenticationController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'swipeApply',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
