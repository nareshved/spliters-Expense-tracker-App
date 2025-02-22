import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spliters/repository/pages/mixins/auth_mixins.dart';

class SignupPage extends StatelessWidget with AuthMixins {
  SignupPage({super.key});

  final _signUpKey = GlobalKey<FormState>();

  final TextEditingController uNameController = TextEditingController();
  final TextEditingController uEmailController = TextEditingController();
  final TextEditingController uPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _signUpKey,
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Register to Your Account",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                nameTextField(
                  hintTextStr: "Name",
                  nameController: uNameController,
                ),
                emailTextField(
                  hintTextStr: "Email",
                  emailController: uEmailController,
                ),
                passwordTextField(
                  hintTextStr: "Password",
                  passController: uPassController,
                ),

                authBtn("SignUp", () {
                  if (_signUpKey.currentState!.validate()) {
                    if (uNameController.text.isNotEmpty &&
                        uEmailController.text.isNotEmpty &&
                        uPassController.text.isNotEmpty) {
                      log("controller empty nahi hai");
                    } else {
                      log("controllers khali hai");
                    }
                  }
                }),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an Account"),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      child: Text(
                        "Login Now",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
