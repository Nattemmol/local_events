import 'package:local_events/repositories/user_repository/user_model.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class AuthenticationUserChanged extends AuthenticationEvent {
  final User? user;

  const AuthenticationUserChanged(this.user);
}

class AuthenticationLogoutRequested extends AuthenticationEvent {
  const AuthenticationLogoutRequested();
}
