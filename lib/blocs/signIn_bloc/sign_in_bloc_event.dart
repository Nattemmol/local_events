part of 'sign_in_bloc.dart';


sealed class SignInEvent{
  const SignInEvent();

  List<Object> get props => [];
}

class SignInRequired extends SignInEvent{
	final String email;
	final String password;

	const SignInRequired(this.email, this.password);
}

class SignOutRequired extends SignInEvent{

	const SignOutRequired();
}