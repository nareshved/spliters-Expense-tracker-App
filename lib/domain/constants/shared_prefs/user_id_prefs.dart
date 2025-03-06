import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spliters/data/firebase/auth/firebase_helper.dart';

//  fix me

class UserIdPrefs {
  String? yourUserId;

  getUserIdFromPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    yourUserId = prefs.getString(FirebaseHelper.loginPrefsKey);

    log("your userId is found $yourUserId");
  }
}
