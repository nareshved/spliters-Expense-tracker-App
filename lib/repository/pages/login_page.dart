import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spliters/data/bloc/register/register_bloc.dart';
import 'package:spliters/data/bloc/register/register_events.dart';
import 'package:spliters/data/bloc/register/register_states.dart';
import 'package:spliters/repository/pages/home_view.dart';
import 'package:spliters/repository/pages/mixins/auth_mixins.dart';
import 'package:spliters/repository/pages/signup_page.dart';

class LoginPage extends StatelessWidget with AuthMixins {
  LoginPage({super.key});

  final TextEditingController uEmailController = TextEditingController();
  final TextEditingController uPassController = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final isPage = ResponsiveApp.isScreenSize(context);
    // final isMobile = ResponsiveApp.isMobile(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: loginFormKey,
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

                BlocConsumer<RegisterBloc, RegisterStates>(
                  listener: (context, state) {
                    if (state is RegisterLoadingState) {
                      authBtn(
                        btnName: "LogIn",
                        onTap: () {},
                        authCircle: SizedBox(
                          width: 12,
                          height: 12,
                          child: CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.black45,
                          ),
                        ),
                      );
                    }

                    if (state is RegisterErrorState) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.errorMsg)));
                    }

                    if (state is RegisterLoadedState) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePageView()),
                      );
                    }
                  },
                  builder: (context, state) {
                    return authBtn(
                      btnName: "LogIn",
                      onTap: () async {
                        if (loginFormKey.currentState!.validate()) {
                          if (uEmailController.text.isNotEmpty &&
                              uPassController.text.isNotEmpty) {
                            BlocProvider.of<RegisterBloc>(context).add(
                              LoginUserEvent(
                                email: uEmailController.text.trim().toString(),
                                password:
                                    uPassController.text.trim().toString(),
                              ),
                            );
                          } else {
                            log("controllers khali hai");
                          }
                        }
                        uEmailController.clear();
                        uPassController.clear();
                      },
                    );
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don`t have an Account",

                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 13),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },

                      child: Text(
                        "Register Now",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
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
