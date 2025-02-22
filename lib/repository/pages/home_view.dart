import 'package:flutter/material.dart';
import 'package:spliters/repository/pages/home_desktop.dart';
import 'package:spliters/repository/pages/home_mobile.dart';
import 'package:spliters/repository/widgets/responsive/app_responsive.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(desktop: HomeDesktop(), mobile: HomeMobile());
  }
}
