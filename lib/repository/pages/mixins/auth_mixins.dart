import 'package:flutter/material.dart';
import '../../widgets/auth_button/auth_button.dart';
import '../../widgets/text_field/custome_text_field.dart';

// static const passwordRegex =
//     r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";

// static const emailRegex =
//     r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$";

mixin AuthMixins {
  Widget nameTextField({
    required String hintTextStr,

    required TextEditingController nameController,
  }) {
    return CustomeTextField(
      loginController: nameController,
      hintText: hintTextStr,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Name is Required";
        }
        return null;
      },
    );
  }

  Widget emailTextField({
    required String hintTextStr,
    required TextEditingController emailController,
  }) {
    return CustomeTextField(
      hintText: hintTextStr,
      loginController: emailController,
      validator: (value) {
        const String emailRegex =
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$";

        RegExp emailReg = RegExp(emailRegex);

        if (value == null || value.isEmpty) {
          return "Email is Required";
        }

        if (!emailReg.hasMatch(value)) {
          return "Enter Valid Email Address";
        }

        return null;
      },
    );
  }

  Widget passwordTextField({
    required String hintTextStr,

    required TextEditingController passController,
  }) {
    return CustomeTextField(
      hintText: hintTextStr,
      loginController: passController,
      validator: (value) {
        const String passwordRegex =
            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";

        RegExp passReg = RegExp(passwordRegex);

        if (value == null || value.isEmpty) {
          return "Password is Required";
        }

        if (!passReg.hasMatch(value)) {
          return "Enter Strong Password";
        }

        return null;
      },
    );
  }

  Widget authBtn(String btnName, VoidCallback onTap) {
    return AuthButton(btnName: btnName, onTap: onTap,);
  }
}
