part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String message;

  LoginSuccess(this.message);
}

final class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
}

// Reset Password
final class ResetLoading extends LoginState {}

final class ResetSuccess extends LoginState {
  final String message;

  ResetSuccess(this.message);
}

final class ResetError extends LoginState {
  final String message;

  ResetError(this.message);
}
