import 'package:flutter/material.dart';
import 'package:spliters/repository/widgets/add_exp_text_field/add_exp_field.dart';
import '../../widgets/auth_button/auth_button.dart';
import '../../widgets/text_field/custome_text_field.dart';

// static const passwordRegex =
//     r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";

// static const emailRegex =
//     r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$";

// firebase auth TextFields

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

  Widget authBtn({required String btnName, required VoidCallback onTap}) {
    return AuthButton(
      btnName: btnName,
      onTap: onTap,
      loadingWidget: Row(
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("LogIn"), CircularProgressIndicator.adaptive()],
      ),
    );
  }
}

// add Expense Controllers TextFields

mixin ExpenseFields {
  Widget expTextField({
    required String hintTextStr,
    required TextInputType keyboardType,
    required TextEditingController mController,
  }) {
    return AddExpField(
      expController: mController,
      keyboardType: keyboardType,
      hintTxt: hintTextStr,
    );
  }
}

// mixin ExpenseFields {
//   Widget expTextField({
//     required String hintTextStr,
//     required TextInputType keyboardType,
//     required TextEditingController mController,
//   }) {
//     return AddExpField(
//       expController: mController,
//       keyboardType: keyboardType,
//       hintTxt: hintTextStr,
//       expValidator: (value) {
//         // remove validator then check
//         if (value!.isEmpty) {
//           return "fill all fields";
//         }
//         return null;
//       },
//     );
//   }
// }
