import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterSubmitted extends RegisterEvent {
  final String email;
  final String password;
  final String confirmPassword;
  final String mobile;
  final String role;
  final String specialization;
  final String experience;
  final String disease;
  final String age;

  RegisterSubmitted({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.mobile,
    required this.role,
    this.specialization = '',
    this.experience = '',
    this.disease = '',
    this.age = '',
  });

  @override
  List<Object?> get props => [
        email,
        password,
        confirmPassword,
        mobile,
        role,
        specialization,
        experience,
        disease,
        age,
      ];
}
