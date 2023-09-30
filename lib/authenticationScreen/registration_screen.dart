import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/authentication_controller.dart';
import 'package:get/get.dart';

import '../widgets/custom_text_field_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // personal info
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();
  TextEditingController phoneNoTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController educationTextEditingController =
      TextEditingController();
  TextEditingController lookingForJobTextEditingController =
      TextEditingController();

  // skills ???
  TextEditingController skillsTextEditingController = TextEditingController();

  // experience ???
  TextEditingController workExperienceTextEditingController =
      TextEditingController();
  TextEditingController organizationsTextEditingController =
      TextEditingController();
  // TextEditingController projectsTextEditingController =
  // TextEditingController();

  // interests ???
  TextEditingController interestsTextEditingController =
      TextEditingController();

  bool showLoadingBar = false;
  var authenticationController = AuthenticationController.authController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),

              // Create Account Text
              const Text(
                "Get started now.",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // space
              const SizedBox(
                height: 10,
              ),

              // To get Started Now
              const Text(
                "Create an acount & land your dream job.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // space
              const SizedBox(
                height: 10,
              ),

              // selects image circle avatar
              // if image is not captured displau CircleAvatar
              // Else display captured image
              authenticationController.imageFile == null
                  ? const CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(
                        "images/avatar.png",
                      ),
                      backgroundColor: Colors.grey,
                    )
                  : Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                          image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: FileImage(
                              File(
                                authenticationController.imageFile!.path,
                              ),
                            ),
                          )),
                    ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      await authenticationController.pickImageFileFromGallery();

                      setState(() {
                        authenticationController.imageFile;
                      });
                    },
                    icon: const Icon(
                      Icons.image_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),

                  // space
                  const SizedBox(
                    width: 10,
                  ),

                  IconButton(
                    onPressed: () async {
                      await authenticationController
                          .captureImageFromPhoneCamera();

                      setState(() {
                        authenticationController.imageFile;
                      });
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                ],
              ),

              // space
              const SizedBox(
                height: 30,
              ),

              // PERSONAL INFO
              const Text(
                "Personal Info:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // space
              const SizedBox(
                height: 12,
              ),

              // NAME
              SizedBox(
                // sets text field according to screen size
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                // allows user to input email
                child: CustomTextFieldWidget(
                  editingController: nameTextEditingController,
                  labelText: "Name",
                  iconData: Icons.person_2_outlined,
                  isObscure: false,
                ),
              ),

              // space
              const SizedBox(
                height: 30,
              ),

              // EMAIL
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

              // space
              const SizedBox(
                height: 24,
              ),

              // PASSWORD
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

              // space
              const SizedBox(
                height: 24,
              ),

              // age
              SizedBox(
                // sets text field according to screen size
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: ageTextEditingController,
                  labelText: "Age",
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),

              // space
              const SizedBox(
                height: 24,
              ),

              // phoneNo
              SizedBox(
                // sets text field according to screen size
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: phoneNoTextEditingController,
                  labelText: "Phone",
                  iconData: Icons.phone,
                  isObscure: false,
                ),
              ),

              // space
              const SizedBox(
                height: 24,
              ),

              // CITY
              SizedBox(
                // sets text field according to screen size
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: cityTextEditingController,
                  labelText: "City",
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),

              // space
              const SizedBox(
                height: 24,
              ),

              // Country
              SizedBox(
                // sets text field according to screen size
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: countryTextEditingController,
                  labelText: "Country",
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),

              // space
              const SizedBox(
                height: 24,
              ),

              // educationLevel
              SizedBox(
                // sets text field according to screen size
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: educationTextEditingController,
                  labelText: "Education",
                  iconData: Icons.text_fields,
                  isObscure: false,
                ),
              ),

              // space
              const SizedBox(
                height: 24,
              ),

              // lookingForWhatJobs
              SizedBox(
                // sets text field according to screen size
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: lookingForJobTextEditingController,
                  labelText: "Job Positions You are Looking For",
                  iconData: Icons.list,
                  isObscure: false,
                ),
              ),

              // space
              const SizedBox(
                height: 24,
              ),

              // Skills Section
              const Text(
                "Skills:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // space
              const SizedBox(
                height: 12,
              ),

              // SKILLS
              SizedBox(
                // sets text field according to screen size
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: skillsTextEditingController,
                  labelText: "Skills",
                  iconData: Icons.edit_attributes,
                  isObscure: false,
                ),
              ),

              // space
              const SizedBox(
                height: 30,
              ),

              // Experience Section
              const Text(
                "Professional Experience:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // space
              const SizedBox(
                height: 12,
              ),

              // PAST WORK EXPERIENCE
              SizedBox(
                // sets text field according to screen size
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: workExperienceTextEditingController,
                  labelText: "Past Work Experience",
                  iconData: Icons.work_history,
                  isObscure: false,
                ),
              ),

              // space
              const SizedBox(
                height: 30,
              ),

              // ORGANIZATIONS
              SizedBox(
                // sets text field according to screen size
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: workExperienceTextEditingController,
                  labelText: "Orginizations/Clubs",
                  iconData: Icons.collections,
                  isObscure: false,
                ),
              ),

              // space
              const SizedBox(
                height: 30,
              ),

              // Interest Section
              const Text(
                "Interests:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // space
              const SizedBox(
                height: 12,
              ),

              // Interests
              SizedBox(
                // sets text field according to screen size
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: interestsTextEditingController,
                  labelText: "Interests:",
                  iconData: Icons.interests,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              // Create Account Button
              Container(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    )),
                child: InkWell(
                  onTap: () async {
                    if (authenticationController.imageFile != null) {
                      // trim removes extra spaces that may be inputted
                      if (nameTextEditingController.text.trim().isNotEmpty &&
                          emailTextEditingController.text.trim().isNotEmpty &&
                          passwordTextEditingController.text
                              .trim()
                              .isNotEmpty &&
                          ageTextEditingController.text.trim().isNotEmpty &&
                          phoneNoTextEditingController.text.trim().isNotEmpty &&
                          cityTextEditingController.text.trim().isNotEmpty &&
                          countryTextEditingController.text.trim().isNotEmpty &&
                          lookingForJobTextEditingController.text
                              .trim()
                              .isNotEmpty &&
                          skillsTextEditingController.text.trim().isNotEmpty &&
                          workExperienceTextEditingController.text
                              .trim()
                              .isNotEmpty &&
                          organizationsTextEditingController.text
                              .trim()
                              .isNotEmpty &&
                          interestsTextEditingController.text
                              .trim()
                              .isNotEmpty) {
                        setState(() {
                          showLoadingBar = true;
                        });

                        await authenticationController.createNewUserAccount(
                          authenticationController.imageProfile!,
                          nameTextEditingController.text.trim(),
                          emailTextEditingController.text.trim(),
                          passwordTextEditingController.text.trim(),
                          ageTextEditingController.text.trim(),
                          phoneNoTextEditingController.text.trim(),
                          cityTextEditingController.text.trim(),
                          countryTextEditingController.text.trim(),
                          educationTextEditingController.text.trim(),
                          lookingForJobTextEditingController.text.trim(),
                          skillsTextEditingController.text.trim(),
                          workExperienceTextEditingController.text.trim(),
                          organizationsTextEditingController.text.trim(),
                          interestsTextEditingController.text.trim(),
                        );
                        setState(() {
                          showLoadingBar = false;
                        });
                      } else {
                        Get.snackbar("A Field is Empty",
                            "Please complete all fields in form.");
                      }
                    } else {
                      Get.snackbar("Image File Missing",
                          "Please pick image from gallery or capture with Camera.");
                    }
                  },
                  child: const Center(
                    child: Text(
                      "Create Account",
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

              // already have an account? login here text
              Row(
                // centers register link
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Text(
                      "Login Here",
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
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
