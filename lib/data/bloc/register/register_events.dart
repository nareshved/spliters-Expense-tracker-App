import 'package:spliters/domain/models/user_model/user_model.dart';

abstract class RegisterEvents {}

class CreateUserEvent extends RegisterEvents {
  UserModel newUser;
  String password;
  CreateUserEvent({required this.newUser, required this.password});
}

class LoginUserEvent extends RegisterEvents {
  final String email, password;

  LoginUserEvent({required this.email, required this.password});
}

class LogOutUserEvent extends RegisterEvents {}
