//import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  // personal info
  //String? imageProfile;
  String? name;
  String? email;
  String? password;
  int? age;
  String? phoneNo;
  String? city;
  String? country;
  String? education;
  String? lookingForJob;
  int? publishedDateTime;

  // skills
  String? skills;

  // experience
  String? workExperience;
  String? organizations;

  // interests
  String? interests;

  // constructor
  Person(
      {
      //this.imageProfile,
      this.name,
      this.email,
      this.password,
      this.age,
      this.phoneNo,
      this.city,
      this.country,
      this.education,
      this.lookingForJob,
      this.publishedDateTime,
      this.skills,
      this.workExperience,
      this.organizations,
      this.interests});

  static Person fromDataSnapshot(DocumentSnapshot snapshot) {
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;

    return Person(
      // personal info
      //imageProfile: dataSnapshot["imageProfile"],
      name: dataSnapshot["name"],
      email: dataSnapshot["email"],
      password: dataSnapshot["password"],
      age: dataSnapshot["age"],
      phoneNo: dataSnapshot["phoneNo"],
      city: dataSnapshot["city"],
      country: dataSnapshot["country"],
      education: dataSnapshot["education"],
      lookingForJob: dataSnapshot["lookingForJob"],
      publishedDateTime: dataSnapshot["publishedDateTime"],

      //skills
      skills: dataSnapshot["skills"],

      // experience
      workExperience: dataSnapshot["workExperience"],
      organizations: dataSnapshot["organizations"],

      // interests
      interests: dataSnapshot["interests"],
    );
  }

  Map<String, dynamic> toJson() => {
        //"imageProfile": imageProfile,
        "name": name,
        "email": email,
        "password": password,
        "age": age,
        "phoneNo": phoneNo,
        "city": city,
        "country": country,
        "education": education,
        "lookingForJob": lookingForJob,
        "publishedDateTime": publishedDateTime,
        "skills": skills,
        "workExperience": workExperience,
        "organizations": organizations,
        "interests": interests,
      };
}
