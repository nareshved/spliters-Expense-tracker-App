import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spliters/data/bloc/register/register_events.dart';
import 'package:spliters/data/bloc/register/register_states.dart';
import 'package:spliters/data/firebase/auth/firebase_helper.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  FirebaseHelper firebaseHelper;
  RegisterBloc({required this.firebaseHelper}) : super(RegisterInitialState()) {
    on<CreateUserEvent>((event, emit) async {
      emit(RegisterLoadingState());

      try {
        await firebaseHelper.createUser(
          userModel: event.newUser,
          userPassword: event.password,
        );

        emit(RegisterLoadedState());
      } catch (e) {
        emit(RegisterErrorState(errorMsg: e.toString()));
      }
    });

    on<LoginUserEvent>((event, emit) async {
      emit(RegisterLoadingState());

      try {
        await firebaseHelper.authenticateUser(
          userEmail: event.email,
          userPassword: event.password,
        );

        emit(RegisterLoadedState());
      } catch (e) {
        emit(RegisterErrorState(errorMsg: e.toString()));
      }
    });
  }
}
