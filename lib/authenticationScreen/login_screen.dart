import 'package:flutter/material.dart';
import 'package:flutter_app/authenticationScreen/registration_screen.dart';
import 'package:flutter_app/widgets/custom_text_field_widget.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_app/jobMatchScreen/job_match_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool showLoadingBar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // space between logo & top of screen
              const SizedBox(
                height: 120,
              ),

              // app logo
              Image.asset(
                "images/search.png",
                width: 150,
              ),

              // space between logo and Welcome text
              const SizedBox(
                height: 10,
              ),

              // Welcome text
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              // space between Welcome and Login now...
              const SizedBox(
                height: 10,
              ),

              // Login now... text
              const Text(
                "Login now to optimize your job search",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              // space between Login now... & Email input box
              const SizedBox(
                height: 28,
              ),

              // email input box
              SizedBox(
                // sets text field according to screen size
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                // allows user to input email
                child: CustomTextFieldWidget(
                  editingController: emailTextEditingController,
                  labelText: "Email",
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),

              // space between email and password input boxes
              const SizedBox(
                height: 24,
              ),

              // password input box
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: passwordTextEditingController,
                  labelText: "Password",
                  iconData: Icons.lock_outline,
                  isObscure: true,
                ),
              ),

              // space between password input and login button
              const SizedBox(
                height: 30,
              ),

              // login button
              Container(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    )),
                child: InkWell(
                  onTap: () {
                    Get.to(const MatchSreen());
                  },
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              // space between login button and register account button
              const SizedBox(
                height: 16,
              ),

              // don't have an account? register here text
              Row(
                // centers register link
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const RegistrationScreen());
                    },
                    child: const Text(
                      "Register Here",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),

              // space
              const SizedBox(
                height: 16,
              ),

              // if showLoadingBar becomes true then display... otherwise if it's empty display an empty container
              showLoadingBar == true
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                    )
                  : Container(),

              // space
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
