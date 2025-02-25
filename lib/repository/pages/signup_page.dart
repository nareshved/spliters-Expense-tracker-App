import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spliters/data/bloc/register/register_bloc.dart';
import 'package:spliters/data/bloc/register/register_events.dart';
import 'package:spliters/data/bloc/register/register_states.dart';
import 'package:spliters/data/firebase/auth/firebase_helper.dart';
import 'package:spliters/domain/models/user_model/user_model.dart';
import 'package:spliters/repository/pages/login_page.dart';

import 'package:spliters/repository/pages/mixins/auth_mixins.dart';

class SignupPage extends StatelessWidget with AuthMixins {
  SignupPage({super.key});

  final signUpKey = GlobalKey<FormState>();

  final TextEditingController uNameController = TextEditingController();
  final TextEditingController uEmailController = TextEditingController();
  final TextEditingController uPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: signUpKey,
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

                BlocConsumer<RegisterBloc, RegisterStates>(
                  listener: (context, state) {
                    if (state is RegisterLoadingState) {
                      Row(
                        spacing: 4,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("SignUp"),
                          CircularProgressIndicator.adaptive(),
                        ],
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
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }
                  },
                  builder: (context, state) {
                    return authBtn("SignUp", () async {
                      if (signUpKey.currentState!.validate()) {
                        if (uNameController.text.isNotEmpty &&
                            uEmailController.text.isNotEmpty &&
                            uPassController.text.isNotEmpty) {
                          log("controller empty nahi hai");

                          UserModel newUser = UserModel(
                            userEmail: uEmailController.text.trim().toString(),
                            userId: FirebaseHelper.firebaseCurrentUserUId,
                            userName: uNameController.text.trim().toString(),
                            userPassword:
                                uPassController.text.trim().toString(),
                          );

                          BlocProvider.of<RegisterBloc>(context).add(
                            CreateUserEvent(
                              newUser: newUser,
                              password: newUser.userPassword,
                            ),
                          );

                          log("data save to model");
                        } else {}
                      }
                      uNameController.clear();
                      uEmailController.clear();
                      uPassController.clear();
                    });
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an Account",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 13),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      child: Text(
                        "Login Now",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
