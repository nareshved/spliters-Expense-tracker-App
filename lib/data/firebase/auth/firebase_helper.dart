import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spliters/domain/models/exp_model/exp_model.dart';
import '../../../domain/models/user_model/user_model.dart';

class FirebaseHelper {
  static final firebaseAuth = FirebaseAuth.instance;
  static final firebaseFirestore = FirebaseFirestore.instance;

  // user Id both for expTable and userTable
  // expTable - kis user ka exp hai - usi ke exp dikhe jab login ho
  // userTable - kon mere app register hai / login hua hai

  static final firebaseCurrentUserUId = FirebaseAuth.instance.currentUser!.uid;
  // static late String firebaseUserUId;

  // firebase collections

  static final String collectionUser = "users";
  static final String collectionExp = "expTable";

  // new collection user ke under collection table
  static final String collectionExpUser = "expenses";

  // new collection in userTable all expense
  static final String allCollectionExpUser = "all expenses";

  // login prefs key
  static final String loginPrefsKey = "isLogin";

  // collection categories for get all categories

  static final String collectionCategory = "categories";

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

      /// create user in firestore
      if (userCredential.user != null) {
        firebaseFirestore
            .collection(collectionUser)
            .doc(userCredential.user!.uid)
            .set(userModel.toMap())
            .then((value) {
              log(userCredential.user!.uid);
              // firebaseUserUId = userCredential.user!.uid;
            })
            .onError((error, stackTrace) {
              log("Error: $error");
              throw Exception("Error: $error");
            });
      }
    } on FirebaseException catch (e) {
      log("Error: $e");

      if (e.code == 'weak-password') {
        throw Exception("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        throw Exception("The account already exists for that email");
      }
      throw Exception("The account already exists for that email");
      // throw Exception("Error: $e");
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

  Future addNewExpense({required ExpenseModel addNewExpense}) async {
    try {
      // await firebaseFirestore
      //     .collection(collectionExp)
      //     .doc(firebaseCurrentUserUId)
      //     .collection(collectionExpUser)
      //     .add(addNewExpense.toMap());

      await firebaseFirestore
          .collection(collectionExp)
          .doc(firebaseCurrentUserUId)
          .collection(collectionExpUser)
          .doc(firebaseAuth.currentUser!.email)
          .collection(allCollectionExpUser)
          .add(addNewExpense.toMap());

      // await  firebaseFirestore
      //   .collection(collectionUser)
      //   .doc(userCredential.user!.uid)
      //   .set(userModel.toMap())
      //   .then((value) {
      //     log(userCredential.user!.uid);
      //     // firebaseUserUId = userCredential.user!.uid;
      //   })
      //   .onError((error, stackTrace) {
      //     log("Error: $error");
      //     throw Exception("Error: $error");
      //   });
    } catch (e) {
      log(e.toString());

      throw Exception(e);
    }
  }

  Future<List<ExpenseModel>> fetchAllExpense() async {
    try {
      var data =
          await firebaseFirestore
              .collection(collectionExp)
              .doc(firebaseCurrentUserUId)
              .collection(collectionExpUser)
              .doc(firebaseAuth.currentUser!.email)
              .collection(allCollectionExpUser)
              .get();

      List<ExpenseModel> listExp = [];

      data.docs.map((e) {
        var eachExp = ExpenseModel.fromJson(e.data());
        listExp.add(eachExp);

        // log(e.data().toString());
      }).toList();

      return listExp;
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  Future updateExpense({
    required ExpenseModel updateExpense,
    required String updateNoteDocId,
  }) async {
    try {
      // await firebaseFirestore
      //     .collection(collectionExp)
      //     .doc(firebaseCurrentUserUId)
      //     .collection(collectionExpUser)
      //     .doc(updateNoteDocId)
      //     .update(updateExpense.toMap());

      await firebaseFirestore
          .collection(collectionExp)
          .doc(firebaseCurrentUserUId)
          .collection(collectionExpUser)
          .doc(firebaseAuth.currentUser!.email)
          .collection(allCollectionExpUser)
          .doc(updateNoteDocId)
          .update(updateExpense.toMap());
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  Future<void> deleteExpense({required String deleteExpDocId}) async {
    try {
      // await firebaseFirestore
      //     .collection(collectionExp)
      //     .doc(firebaseCurrentUserUId)
      //     .collection(collectionExpUser)
      //     .doc(deleteExpDocId)
      //     .delete();
      await firebaseFirestore
          .collection(collectionExp)
          .doc(firebaseCurrentUserUId)
          .collection(collectionExpUser)
          .doc(firebaseAuth.currentUser!.email)
          .collection(allCollectionExpUser)
          .doc(deleteExpDocId)
          .delete();
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  // get categories

  Future<QuerySnapshot<Map<String, dynamic>>> getAllCategories() async {
    QuerySnapshot<Map<String, dynamic>> categories;
    try {
      categories = await firebaseFirestore.collection(collectionCategory).get();
    } catch (e) {
      log(e.toString());

      throw Exception(e);
    }

    return categories;
  }
}




// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:spliters/domain/models/exp_model/exp_model.dart';
// import '../../../domain/models/user_model/user_model.dart';

// class FirebaseHelper {
//   static final firebaseAuth = FirebaseAuth.instance;
//   static final firebaseFirestore = FirebaseFirestore.instance;

//   // user Id both for expTable and userTable
//   // expTable - kis user ka exp hai - usi ke exp dikhe jab login ho
//   // userTable - kon mere app register hai / login hua hai

//   static final firebaseCurrentUserUId = FirebaseAuth.instance.currentUser!.uid;

//   // firebase collections

//   static final String collectionUser = "users";
//   static final String collectionExp = "expTable";

//   // new collection user ke under collection table
//   static final String collectionExpUser = "expenses";

//   // login prefs key
//   static final String loginPrefsKey = "isLogin";

//   // users columns

//   static const String columnUserId = "uId";
//   static const String columnUserName = "uName";
//   static const String columnUserEmail = "uEmail";
//   static const String columnUserPassword = "uPassword";

//   // Expense columns
//   // columnExpId - unique - fix me
//   static const String columnExpId = "expId";
//   static const String columnExpTitle = "expTitle";
//   static const String columnExpDesc = "expDesc";
//   static const String columnExpTimeStamp = "expTimeStamp";
//   static const String columnExpAmount = "expAmount";
//   static const String columnExpMainBalance = "expMainBalance";
//   static const String columnExpType = "expType"; // 0 debit  / 1 credit
//   static const String columnExpCatType = "expCatType"; // sports, salon

//   Future<void> createUser({
//     required UserModel userModel,
//     required String userPassword,
//   }) async {
//     try {
//       UserCredential userCredential = await firebaseAuth
//           .createUserWithEmailAndPassword(
//             email: userModel.userEmail,
//             password: userPassword,
//           );

//       if (userCredential.user != null) {
//         // user collection created - you can make more diff collections below

//         firebaseFirestore
//             .collection(collectionUser)
//             .doc(userCredential.user!.uid)
//             .set(userModel.toMap());
//       }
//     } on FirebaseException catch (e) {
//       if (e.code == 'user-not-found') {
//         throw Exception("No user found for that email.");
//       } else if (e.code == 'wrong-password') {
//         throw Exception("Wrong password provided for that user.");
//       }

//       throw Exception("Wrong Email or password please check");
//     } catch (e) {
//       log("create user collctions error in firebase ${e.toString()}");
//       throw Exception(e);
//     }
//   }

//   Future<void> authenticateUser({
//     required String userEmail,
//     required String userPassword,
//   }) async {
//     try {
//       final UserCredential userCredential = await firebaseAuth
//           .signInWithEmailAndPassword(email: userEmail, password: userPassword);

//       if (userCredential.user != null) {
//         var prefs = await SharedPreferences.getInstance();
//         prefs.setString(loginPrefsKey, userCredential.user!.uid);
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         log('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         log('Wrong password provided for that user.');
//       }

//       throw Exception("Wrong Email or password please check");
//     } catch (e) {
//       log("login error in firebase ${e.toString()}");
//       throw Exception(e);
//     }
//   }

//   Future addNewExpense({required ExpenseModel addNewExpense}) async {
//     try {
//       return await firebaseFirestore
//           .collection(collectionExp)
//           .doc(firebaseCurrentUserUId)
//           .collection(collectionExpUser)
//           .add(addNewExpense.toMap());
//     } catch (e) {
//       log(e.toString());

//       throw Exception(e);
//     }
//   }

//   Future<List<ExpenseModel>> fetchAllExpense() async {
//     try {
//       var data = await firebaseFirestore.collection(collectionExp).get();
//       List<ExpenseModel> listExp = [];

//       data.docs.map((e) {
//         var eachExp = ExpenseModel.fromJson(e.data());
//         listExp.add(eachExp);
//       }).toList();

//       return listExp;
//     } catch (e) {
//       log(e.toString());
//       throw Exception(e);
//     }
//   }

//   Future updateExpense({
//     required ExpenseModel updateExpense,
//     required String updateNoteDocId,
//   }) async {
//     try {
//       await firebaseFirestore
//           .collection(collectionExp)
//           .doc(firebaseCurrentUserUId)
//           .collection(collectionExpUser)
//           .doc(updateNoteDocId)
//           .update(updateExpense.toMap());
//     } catch (e) {
//       log(e.toString());
//       throw Exception(e);
//     }
//   }

//   Future<void> deleteExpense({required String deleteExpDocId}) async {
//     try {
//       await firebaseFirestore
//           .collection(collectionExp)
//           .doc(firebaseCurrentUserUId)
//           .collection(collectionExpUser)
//           .doc(deleteExpDocId)
//           .delete();
//     } catch (e) {
//       log(e.toString());
//       throw Exception(e);
//     }
//   }

//   // get categories

//   Future<QuerySnapshot<Map<String, dynamic>>> getAllCategories() async {
//     QuerySnapshot<Map<String, dynamic>> categories;
//     try {
//       categories = await firebaseFirestore.collection("Categories").get();
//     } catch (e) {
//       log(e.toString());

//       throw Exception(e);
//     }

//     return categories;
//   }
// }
