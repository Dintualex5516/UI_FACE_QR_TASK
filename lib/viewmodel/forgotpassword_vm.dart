import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/auth_model.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  final AuthModel model;

  ForgotPasswordViewModel(this.model);

  Future<String?> sendResetLink() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: model.emailController.text.trim(),
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
