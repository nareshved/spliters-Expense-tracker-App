import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spliters/data/firebase/auth/firebase_helper.dart';
import 'package:spliters/domain/constants/app_info/app_info.dart';
import 'package:spliters/repository/pages/home_view.dart';
import 'package:spliters/repository/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () async {
      var prefs = await SharedPreferences.getInstance();
      String? myKey = prefs.getString(FirebaseHelper.loginPrefsKey);

      Widget navigateTo = LoginPage();

      if (myKey != null && myKey != "") {
        navigateTo = const HomePageView();
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => navigateTo),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      body: SafeArea(
        child: Center(
          child: Text(
            AppInfo.appName,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
