import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_task/views/homescreens/loginhomescreen.dart';
import 'package:ui_task/views/login & signup screens/forgetpassword.dart';
import 'package:ui_task/views/login & signup screens/signuppage.dart';
import '/model/auth_model.dart';
import '/viewmodel/login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = AuthModel();

    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(model),
      child: Consumer<LoginViewModel>(
        builder: (context, vm, _) {
          return Scaffold(
            body: Stack(
              children: [
                // Top-left background decoration
                Positioned(
                  top: -100,
                  left: -100,
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(200),
                      ),
                    ),
                  ),
                ),

                // Bottom-right background decoration
                Positioned(
                  bottom: -100,
                  right: -100,
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: const BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(200),
                      ),
                    ),
                  ),
                ),

                // Foreground login form
                Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Form(
                      key: vm.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "ZiyaAttend",
                            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            "Login",
                            style: TextStyle(fontSize: 18, color: Colors.green),
                          ),
                          const SizedBox(height: 32),
                          TextFormField(
                            controller: model.emailController,
                            decoration: const InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: model.passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: vm.isLoading
                                  ? null
                                  : () async {
                                      final error = await vm.login();
                                      if (error == null) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (_) => LoginHomeScreen()),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text(error)),
                                        );
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: vm.isLoading
                                  ? const CircularProgressIndicator(color: Colors.white)
                                  : const Text("Login", style: TextStyle(color: Colors.white, fontSize: 16)),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const ForgotPasswordPage()),
                            ),
                            child: const Text("Forgot Password?"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account? "),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => const SignupPage()),
                                ),
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
