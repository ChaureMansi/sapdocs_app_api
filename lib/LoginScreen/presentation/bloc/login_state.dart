import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String email;
  final String role;

  const LoginSuccess({required this.email, required this.role});

  @override
  List<Object> get props => [email, role];
}

class LoginFailure extends LoginState {}

class LoginError extends LoginState {}
