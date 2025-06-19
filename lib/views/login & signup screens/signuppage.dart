import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_task/views/login & signup screens/loginpage.dart';
import '/model/auth_model.dart';
import '/viewmodel/signup_viewmodel.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = AuthModel();
    return ChangeNotifierProvider(
      create: (_) => SignupViewModel(model),
      child: Consumer<SignupViewModel>(
        builder: (context, vm, _) {
          return Scaffold(
            body: Stack(
              children: [
                // Top-left decorative curve
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
                // Bottom-right decorative curve
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
                // Signup Form
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
                          const SizedBox(height: 8),
                          const Text("Create an account", style: TextStyle(fontSize: 18, color: Colors.green)),
                          const SizedBox(height: 24),
                          TextFormField(
                            controller: model.nameController,
                            decoration: const InputDecoration(labelText: "Name", border: OutlineInputBorder()),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: model.emailController,
                            decoration: const InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: model.mobileController,
                            decoration: const InputDecoration(labelText: "Mobile Number", border: OutlineInputBorder()),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: model.passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(labelText: "Password", border: OutlineInputBorder()),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: model.confirmPasswordController,
                            obscureText: true,
                            decoration: const InputDecoration(labelText: "Confirm Password", border: OutlineInputBorder()),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: vm.isLoading
                                  ? null
                                  : () async {
                                      final error = await vm.signup();
                                      if (error == null) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text("Signup successful")),
                                        );
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(builder: (_) => const LoginPage()));
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text(error)),
                                        );
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              child: vm.isLoading
                                  ? const CircularProgressIndicator(color: Colors.white)
                                  : const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 16)),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account? "),
                              GestureDetector(
                                onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (_) => const LoginPage()),
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
