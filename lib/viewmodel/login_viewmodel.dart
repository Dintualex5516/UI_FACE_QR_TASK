import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/auth_model.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthModel model;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  LoginViewModel(this.model);

  Future<String?> login() async {
    try {
      isLoading = true;
      notifyListeners();

      await FirebaseAuth.instance.signInWithEmailAndPassword(
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
