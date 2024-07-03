import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdocs_app_api/LoginScreen/data/repository.dart';
import 'package:sapdocs_app_api/LoginScreen/presentation/bloc/login_event.dart';
import 'package:sapdocs_app_api/LoginScreen/presentation/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Repository repository;

  LoginBloc(this.repository) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final response = await repository.login(event.email, event.password);
      if (response['statusCode'] == 200) {
        String role = response['role'];
        emit(LoginSuccess(email: event.email, role: role));
      } else {
        emit(LoginFailure());
      }
    } catch (_) {
      emit(LoginError());
    }
  }
}
