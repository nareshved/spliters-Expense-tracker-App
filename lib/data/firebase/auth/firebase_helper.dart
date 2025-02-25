import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/models/user_model/user_model.dart';

class FirebaseHelper {
  static final firebaseAuth = FirebaseAuth.instance;
  static final firebaseFirestore = FirebaseFirestore.instance;

  // user Id both for expTable and userTable
  // expTable - kis user ka exp hai - usi ke exp dikhe jab login ho
  // userTable - kon mere app register hai / login hua hai

  static final firebaseCurrentUserUId = FirebaseAuth.instance.currentUser!.uid;

  // firebase collections

  static final String collectionUser = "usersTable";
  static final String collectionExp = "expTable";

  // login prefs key
  static final String loginPrefsKey = "isLogin";

  // users columns

  static const String columnUserId = "uId";
  static const String columnUserName = "uName";
  static const String columnUserEmail = "uEmail";
  static const String columnUserPassword = "uPassword";

  // Expense columns
  // columnExpId - unique - fix me
  static const String columnExpId = "expId";
  static const String columnExpTitle = "expTitle";
  static const String columnExpDesc = "expDesc";
  static const String columnExpTimeStamp = "expTimeStamp";
  static const String columnExpAmount = "expAmount";
  static const String columnExpMainBalance = "expMainBalance";
  static const String columnExpType = "expType"; // 0 debit  / 1 credit
  static const String columnExpCatType = "expCatType"; // sports, salon

  Future<void> createUser({
    required UserModel userModel,
    required String userPassword,
  }) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(
            email: userModel.userEmail,
            password: userPassword,
          );

      if (userCredential.user != null) {
        // user collection created - you can make more diff collections below

        firebaseFirestore
            .collection(collectionUser)
            .doc(userCredential.user!.uid)
            .set(userModel.toMap());
      }
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        throw Exception("Wrong password provided for that user.");
      }

      throw Exception("Wrong Email or password please check");
    } catch (e) {
      log("create user collctions error in firebase ${e.toString()}");
      throw Exception(e);
    }
  }

  Future<void> authenticateUser({
    required String userEmail,
    required String userPassword,
  }) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: userEmail, password: userPassword);

      if (userCredential.user != null) {
        var prefs = await SharedPreferences.getInstance();
        prefs.setString(loginPrefsKey, userCredential.user!.uid);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }

      throw Exception("Wrong Email or password please check");
    } catch (e) {
      log("login error in firebase ${e.toString()}");
      throw Exception(e);
    }
  }
}
