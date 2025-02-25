import 'package:spliters/data/firebase/auth/firebase_helper.dart';

class UserModel {
  final String userId, userName, userEmail, userPassword;

  UserModel({
    required this.userEmail,
    required this.userId,
    required this.userName,
    required this.userPassword,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      userEmail: map[FirebaseHelper.columnUserEmail],
      userId: map[FirebaseHelper.columnUserId],
      userName: map[FirebaseHelper.columnUserName],
      userPassword: map[FirebaseHelper.columnUserPassword],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      FirebaseHelper.columnUserId: userId,
      FirebaseHelper.columnUserName: userName,
      FirebaseHelper.columnUserEmail: userEmail,
      FirebaseHelper.columnUserPassword: userPassword,
    };
  }
}
