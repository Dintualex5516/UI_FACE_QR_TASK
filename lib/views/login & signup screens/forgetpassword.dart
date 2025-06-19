import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/model/auth_model.dart';
import '/viewmodel/forgotpassword_vm.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = AuthModel();
    return ChangeNotifierProvider(
      create: (_) => ForgotPasswordViewModel(model),
      child: Consumer<ForgotPasswordViewModel>(
        builder: (context, vm, _) {
          return Scaffold(
            appBar: AppBar(title: const Text("Forgot Password")),
            body: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Reset your password", style: TextStyle(fontSize: 18)),
                  TextFormField(controller: model.emailController, decoration: const InputDecoration(labelText: "Email")),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      final error = await vm.sendResetLink();
                      if (error == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Reset link sent")),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
                      }
                    },
                    child: const Text("Send Reset Link"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
