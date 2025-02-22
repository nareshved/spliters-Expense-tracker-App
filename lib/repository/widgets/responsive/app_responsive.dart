import 'package:flutter/material.dart';

class ResponsiveApp extends StatelessWidget {
  const ResponsiveApp({super.key, required this.desktop, required this.mobile});

  final Widget desktop;
  final Widget mobile;

  // current size of screen
  static Size isScreenSize(BuildContext context) {
    return MediaQuery.sizeOf(context);
  }

  // get width of every screens size for homepage view
  static bool isDesktop(BuildContext context) {
    return MediaQuery.sizeOf(context).width > MediaQuery.sizeOf(context).height;
  }

  // get height of every screen size for homepage view
  static bool isMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).height > MediaQuery.sizeOf(context).width;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > constraints.maxHeight) {
          return desktop;
        } else {
          return mobile;
        }
      },
    );
  }
}
