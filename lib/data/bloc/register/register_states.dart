abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterLoadedState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  final String errorMsg;

  RegisterErrorState({required this.errorMsg});
}
