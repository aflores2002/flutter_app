import 'package:flutter/material.dart';

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
              Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
