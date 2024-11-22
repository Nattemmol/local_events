

part of 'sign_in_bloc.dart';

sealed class SignInState{
  const SignInState();

  List<Object> get props => [];
}

final class SignInInitial extends SignInState {}

class SignInSuccess extends SignInState {}
class SignInFailure extends SignInState {
	final String? message;

	const SignInFailure({this.message});
}
class SignInProcess extends SignInState {}