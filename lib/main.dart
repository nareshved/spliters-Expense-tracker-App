import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:spliters/data/bloc/expense_bloc/expense_bloc.dart';
import 'package:spliters/data/bloc/register/register_bloc.dart';
import 'package:spliters/data/firebase/auth/firebase_helper.dart';
import 'package:spliters/data/provider/dark_theme/dark_theme.dart';
import 'package:spliters/domain/app_theme/app_theme.dart';
import 'package:spliters/firebase_options.dart';

import 'package:spliters/repository/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(firebaseHelper: FirebaseHelper()),
        ),
        BlocProvider(
          create: (context) => ExpenseBloc(firebaseHelper: FirebaseHelper()),
        ),
      ],

      child: ChangeNotifierProvider(
        create: (context) => DarkThemeProvider(),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeAnimationCurve: Curves.easeIn,
      themeAnimationDuration: Durations.short3,
      theme: isLightTheme,
      darkTheme: isDarkTheme,
      // themeMode: ThemeMode.dark,
      themeMode:
          context.watch<DarkThemeProvider>().themeValue
              ? ThemeMode.dark
              : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
// import 'package:spliters/data/bloc/expense_bloc/expense_bloc.dart';
// import 'package:spliters/data/bloc/register/register_bloc.dart';
// import 'package:spliters/data/firebase/auth/firebase_helper.dart';
// import 'package:spliters/data/provider/dark_theme/dark_theme.dart';
// import 'package:spliters/domain/app_theme/app_theme.dart';
// import 'package:spliters/firebase_options.dart';
// import 'package:spliters/repository/pages/splash_page.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   runApp(
//     MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => RegisterBloc(firebaseHelper: FirebaseHelper()),
//         ),
//         BlocProvider(
//           create: (context) => ExpenseBloc(firebaseHelper: FirebaseHelper()),
//         ),
//       ],

//       child: ChangeNotifierProvider(
//         create: (context) => DarkThemeProvider(),
//         child: MyApp(),
//       ),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       themeAnimationCurve: Curves.easeIn,
//       themeAnimationDuration: Durations.short3,
//       theme: isLightTheme,
//       darkTheme: isDarkTheme,
//       themeMode:
//           context.watch<DarkThemeProvider>().themeValue
//               ? ThemeMode.dark
//               : ThemeMode.light,
//       debugShowCheckedModeBanner: false,
//       home: SplashPage(),
//     );
//   }
// }
