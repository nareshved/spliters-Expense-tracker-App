import 'package:flutter/material.dart';
import 'package:spliters/repository/widgets/responsive/app_responsive.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField({
    super.key,
    required this.hintText,
    required this.loginController,
    required this.validator,
  });

  final String hintText;
  final TextEditingController loginController;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveApp.isMobile(context);
    final isPage = ResponsiveApp.isScreenSize(context);
    return Container(
      width: isMobile ? isPage.width * 0.7 : isPage.width * 0.3,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: TextFormField(
        controller: loginController,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,

          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
          contentPadding: EdgeInsets.all(3),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
