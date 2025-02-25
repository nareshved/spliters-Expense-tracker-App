import 'package:spliters/data/firebase/auth/firebase_helper.dart';

class Expensemodel {
  int userId;
  int expId;
  String expTitle, expDesc, expTimeStamp;
  num expAmount, expMainBalance;
  int expType;
  int expCatType;

  Expensemodel({
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

  factory Expensemodel.fromJson(Map<String, dynamic> map) {
    return Expensemodel(
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
}
