import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spliters/repository/pages/mixins/auth_mixins.dart';
import 'package:spliters/repository/pages/signup_page.dart';

class LoginPage extends StatelessWidget with AuthMixins {
  LoginPage({super.key});

  final TextEditingController uEmailController = TextEditingController();
  final TextEditingController uPassController = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final isPage = ResponsiveApp.isScreenSize(context);
    // final isMobile = ResponsiveApp.isMobile(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _loginFormKey,
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login to Your Account",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                emailTextField(
                  hintTextStr: "Email",
                  emailController: uEmailController,
                ),
                passwordTextField(
                  hintTextStr: "Password",
                  passController: uPassController,
                ),

                authBtn("LogIn", () {
                  if (_loginFormKey.currentState!.validate()) {
                    if (uEmailController.text.isNotEmpty &&
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
                    Text("Don`t have an Account"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },

                      child: Text(
                        "Register Now",
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
