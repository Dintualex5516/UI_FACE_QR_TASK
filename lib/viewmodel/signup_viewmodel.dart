import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/auth_model.dart';

class SignupViewModel extends ChangeNotifier {
  final AuthModel model;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  SignupViewModel(this.model);

  Future<String?> signup() async {
    try {
      isLoading = true;
      notifyListeners();

      if (model.passwordController.text != model.confirmPasswordController.text) {
        return "Passwords do not match";
      }

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: model.emailController.text.trim(),
        password: model.passwordController.text.trim(),
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void disposeControllers() {
    model.dispose();
  }
}
