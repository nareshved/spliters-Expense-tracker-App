import 'package:spliters/data/firebase/auth/firebase_helper.dart';

class ExpenseModel { 
  String userId;        // int for sqlite database or string for firebase
  // int userId;  // chenged int to string for firebase
  int expId;
  String expTitle, expDesc, expTimeStamp;
  int expAmount;
  num expMainBalance;
  int expType;
  int expCatType;

  ExpenseModel({
    required this.expAmount,
    required this.expCatType,
    required this.expDesc,
    required this.expId,
    required this.expMainBalance,
    required this.expTimeStamp,
    required this.expTitle,
    required this.expType,
    required this.userId,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> map) {
    return ExpenseModel(
      expAmount: map[FirebaseHelper.columnExpAmount],
      expCatType: map[FirebaseHelper.columnExpCatType],
      expDesc: map[FirebaseHelper.columnExpDesc],
      expId: map[FirebaseHelper.columnExpId],
      expMainBalance: map[FirebaseHelper.columnExpMainBalance],
      expTimeStamp: map[FirebaseHelper.columnExpTimeStamp],
      expTitle: map[FirebaseHelper.columnExpTitle],
      expType: map[FirebaseHelper.columnExpType],
      userId: map[FirebaseHelper.columnUserId],
    );
  }

  // toMap for firebase

  Map<String, dynamic> toMap() {
    return {
      FirebaseHelper.columnExpAmount: expAmount,
      FirebaseHelper.columnExpCatType: expCatType,
      FirebaseHelper.columnExpDesc: expDesc,
      FirebaseHelper.columnExpId: expId,
      FirebaseHelper.columnExpMainBalance: expMainBalance,
      FirebaseHelper.columnExpTimeStamp: expTimeStamp,
      FirebaseHelper.columnExpTitle: expTitle,
      FirebaseHelper.columnExpType: expType,
      FirebaseHelper.columnUserId: userId,
    };
  }
}
