import 'package:local_events/repositories/user_repository/user_model.dart';

sealed class SignUpEvent{
  const SignUpEvent();

  List<Object> get props => [];
}

class SignUpRequired extends SignUpEvent{
	final User user;
	final String password;

	const SignUpRequired(this.user, this.password);
}