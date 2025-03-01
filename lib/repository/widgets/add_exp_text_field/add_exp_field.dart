import 'package:flutter/material.dart';
import 'package:spliters/repository/widgets/responsive/app_responsive.dart';

class AddExpField extends StatelessWidget {
  const AddExpField({
    super.key,

    required this.hintTxt,
    required this.expController,
    this.mxWidget,
    required this.keyboardType,
    // required this.expValidator,
  });

  final String hintTxt;
  final Widget? mxWidget;
  final TextInputType keyboardType;
  final TextEditingController expController;
  // final String? Function(String?)? expValidator;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveApp.isMobile(context);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: isMobile ? 15 : 40,
        vertical: isMobile ? 10 : 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextFormField(
        controller: expController,
        // validator: expValidator,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          hintText: hintTxt,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
          contentPadding: EdgeInsets.only(left: 4),
          border: InputBorder.none,
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
