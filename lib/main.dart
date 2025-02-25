import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spliters/data/bloc/register/register_bloc.dart';
import 'package:spliters/data/firebase/auth/firebase_helper.dart';
import 'package:spliters/domain/app_theme/app_theme.dart';
import 'package:spliters/firebase_options.dart';
import 'package:spliters/repository/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    BlocProvider(
      create: (context) => RegisterBloc(firebaseHelper: FirebaseHelper()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isLightTheme,
      darkTheme: isDarkTheme,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
