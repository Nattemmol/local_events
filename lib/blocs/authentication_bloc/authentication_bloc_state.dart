import 'package:local_events/repositories/user_repository/user_model.dart';


enum AuthenticationStatus { authenticated, unauthenticated, unknown }

class AuthenticationState {
  final AuthenticationStatus status;
  final User? user;

  const AuthenticationState._({
    required this.status,
    this.user,
  });

  const AuthenticationState.unknown() : this._(status: AuthenticationStatus.unknown);

  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  List<Object?> get props => [status, user];
}
