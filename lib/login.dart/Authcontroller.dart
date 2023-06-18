import 'package:b_green/bottomnav_added.dart';
import 'package:b_green/login.dart/signin.dart';
//import 'package:b_green/page/bottompages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AuthController extends GetxController {
  static final AuthController instance = Get.find();
  //static final Authcontroller instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _intialScreen);
  }

  _intialScreen(User? user) {
    if (user == null) {
      print("move to login");
      Get.offAll(() => const Signin());
    } else {
      Get.offAll(() => BottomPage(email:user.email!));
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print("exception occured in registeration");
      Get.snackbar("About user", "user message",
          titleText: const Text(
            "account Creation Failed",
            style: TextStyle(),
          ),
          messageText: Text(e.toString()));
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print("exception occured in Login!");
      Get.snackbar("About user", "user message",
          titleText: const Text(
            "Login Failed",
            style: TextStyle(),
          ),
          messageText: Text(e.toString()));
    }
  }

  void logout() async {
    try {
      await auth.signOut();
    } catch (e) {
      print("exception occured in sign_out");
      Get.snackbar("About user", "user message",
          titleText: const Text(
            "Sign out Failed",
            style: TextStyle(),
          ),
          messageText: Text(e.toString()));
    }
  }
}
