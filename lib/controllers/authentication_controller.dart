import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_app/models/person.dart' as personModel;

class AuthenticationController extends GetxController {
  static AuthenticationController authController = Get.find();

  late Rx<File?> pickedFile;
  File? get profileImage => pickedFile.value;
  XFile? imageFile;

  pickImageFileFromGallery() async {
    final imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      Get.snackbar(
          "Profile Image", "you have successfully picked your profile image.");
    }
    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  // lets user take profile pictures using phone camera
  captureImageFromPhoneCamera() async {
    final imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (imageFile != null) {
      Get.snackbar(
          "Profile Image", "you have successfully taken your profile image.");
    }
    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  Future<String> uploadImageToStorage(File imageFile) async {
    Reference referenceStorage = FirebaseStorage.instance
        .ref()
        .child("Profile Images")
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask task = referenceStorage.putFile(imageFile);
    TaskSnapshot snapshot = await task;

    String downloadUrlOfImage = await snapshot.ref.getDownloadURL();

    return downloadUrlOfImage;
  }

  createNewUserAccount(
      File profileImage,
      String name,
      String email,
      String password,
      String age,
      String phoneNo,
      String city,
      String country,
      String education,
      String lookingForJob,
      String publishedDateTime,
      String skills,
      String workExperience,
      String organizations,
      String interests) async {
    try {
      // 1. authenticate user & create account with email & password
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // 2. upload image to storage
      String urlOfDownloadedImage = await uploadImageToStorage(profileImage);

      // 3. save user info to firestore database
      personModel.Person personInstance = personModel.Person(
        // personal info
        profileImage: urlOfDownloadedImage,
        name: name,
        email: email,
        password: password,
        age: age,
        phoneNo: phoneNo,
        city: city,
        country: country,
        education: education,
        lookingForJob: lookingForJob,
        publishedDateTime: DateTime.now().millisecondsSinceEpoch,

        workExperience: workExperience,
        organizations: organizations,

        interests: interests,
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(personInstance.toJson());

      Get.snackbar(
          "Account Created", "Congratulations, your account has been created.");
    } catch (errorMsg) {
      Get.snackbar("Account Creation Unsuccessful", "Error occured: $errorMsg");
    }
  }
}
