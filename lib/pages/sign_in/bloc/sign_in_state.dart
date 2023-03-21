part of 'sign_in_bloc.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInValidState extends SignInState {}

class SignInError extends SignInState {
  final String errorMessage;

  SignInError(this.errorMessage);
}

class SignInLoadingState extends SignInState {}
