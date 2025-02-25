import 'package:flutter/material.dart';

import '../responsive/app_responsive.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.btnName,
    required this.onTap,
    this.loadingWidget,
  });

  final String btnName;
  final VoidCallback onTap;
  final Widget? loadingWidget;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveApp.isMobile(context);
    final isPage = ResponsiveApp.isScreenSize(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 47,
        width: isMobile ? isPage.width * 0.7 : isPage.width * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Center(
          child:
              loadingWidget ??
              Text(btnName, style: Theme.of(context).textTheme.bodyMedium),
        ),
      ),
    );
  }
}
