import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:local_events/blocs/authentication_bloc/authentication_bloc_event.dart';
import 'package:local_events/blocs/authentication_bloc/authentication_bloc_state.dart';
import 'package:local_events/repositories/user_repository/user_model.dart';
import 'package:local_events/repositories/user_repository/user_repository.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  late final StreamSubscription<User?> _userSubscription;

  AuthenticationBloc({required this.userRepository})
      : super(const AuthenticationState.unknown()) {
    // Listen to authentication state changes from the repository
    _userSubscription = userRepository.user.listen((customUser) {
      add(AuthenticationUserChanged(customUser));
    });

    // Handle events
    on<AuthenticationUserChanged>(_onUserChanged);
    on<AuthenticationLogoutRequested>(_onLogoutRequested);
  }

  void _onUserChanged(AuthenticationUserChanged event, Emitter<AuthenticationState> emit) {
    if (event.user != null) {
      emit(AuthenticationState.authenticated(event.user!));
    } else {
      emit(const AuthenticationState.unauthenticated());
    }
  }

  Future<void> _onLogoutRequested(AuthenticationLogoutRequested event, Emitter<AuthenticationState> emit) async {
    await userRepository.signOut();
    emit(const AuthenticationState.unauthenticated());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
