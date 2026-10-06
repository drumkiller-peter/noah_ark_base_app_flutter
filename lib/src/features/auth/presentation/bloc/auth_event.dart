part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class AuthCheckRequested extends AuthEvent {
  const AuthCheckRequested();
}

class AuthLoginSubmitted extends AuthEvent {
  final String identifier;
  final String password;
  const AuthLoginSubmitted({required this.identifier, required this.password});
  @override
  List<Object?> get props => [identifier, password];
}

class AuthRegisterSubmitted extends AuthEvent {
  final String fullName;
  final String? email;
  final String? phone;
  final String password;
  const AuthRegisterSubmitted({
    required this.fullName,
    this.email,
    this.phone,
    required this.password,
  });
  @override
  List<Object?> get props => [fullName, email, phone, password];
}

class AuthLogoutRequested extends AuthEvent {
  const AuthLogoutRequested();
}