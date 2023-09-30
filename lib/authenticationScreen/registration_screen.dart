import 'package:flutter/material.dart';

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
  TextEditingController educationLevelTextEditingController =
      TextEditingController();
  TextEditingController lookingForWhatJobPositionTextEditingController =
      TextEditingController();

  // skills ???
  TextEditingController skillsTextEditingController = TextEditingController();

  // experience ???
  TextEditingController workExperienceTextEditingController =
      TextEditingController();
  TextEditingController organizationsTextEditingController =
      TextEditingController();
  TextEditingController projectsTextEditingController = TextEditingController();

  // interests ???
  TextEditingController interestsTextEditingController =
      TextEditingController();

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
                "Create Account",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // space
              const SizedBox(
                height: 10,
              ),

              // To get Started Now
              const Text(
                "To get Started Now.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // space
              const SizedBox(
                height: 10,
              ),

              // selects image circle avatar
              GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(
                    "images/avatar.png",
                  ),
                  backgroundColor: Colors.grey,
                ),
              ),

              // space
              const SizedBox(
                height: 30,
              ),

              // PERSONAL INFO
              Text(
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
                  editingController: educationLevelTextEditingController,
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
                  editingController:
                      lookingForWhatJobPositionTextEditingController,
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
              Text(
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
              Text(
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
              Text(
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
            ],
          ),
        ),
      ),
    );
  }
}
