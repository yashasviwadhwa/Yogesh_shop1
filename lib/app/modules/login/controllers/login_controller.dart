import 'package:e_shop/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  late SharedPreferences _preferences;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void onInit() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.onClose();
  }

  void onTapSignIn() async {
     Get.offAndToNamed(Routes.HOME);
    //   try {
    //     await FirebaseAuth.instance
    //         .createUserWithEmailAndPassword(
    //         email: _emailController.text.trim(),
    //         password: _passwordController.text.trim());
    //   } on FirebaseAuthException catch (e) {
    //     if (e.code == "weak-password") {
    //       print('The password provided is too weak.');
    //     } else if (e.code == "email-already-in-use") {
    //       print('An account already exists for that email.');
    //     }
    //   } catch (e) {
    //     print(e);
    //   }

  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;
      _preferences = await SharedPreferences.getInstance();
      _preferences.setString("uID", user?.uid ?? '');
      onTapSignIn();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

}
