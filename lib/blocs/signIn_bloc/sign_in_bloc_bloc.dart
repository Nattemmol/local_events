import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:local_events/repositories/user_repository/user_repository.dart';

// SignIn Events
abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object?> get props => [];
}

class SignInRequired extends SignInEvent {
  final String email;
  final String password;

  const SignInRequired({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class SignOutRequired extends SignInEvent {}

// SignIn States
abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object?> get props => [];
}

class SignInInitial extends SignInState {}

class SignInProcess extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInFailure extends SignInState {
  final String message;

  const SignInFailure({this.message = "Unknown error occurred"});

  @override
  List<Object?> get props => [message];
}

// The Bloc
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository _userRepository;

  SignInBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SignInInitial()) {
    on<SignInRequired>(_onSignIn);
    on<SignOutRequired>(_onSignOut);
  }

  Future<void> _onSignIn(SignInRequired event, Emitter<SignInState> emit) async {
    emit(SignInProcess());
    try {
      await _userRepository.signInWithEmailAndPassword(email: '', password: '');
      emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      emit(SignInFailure(message: e.code));
    } catch (_) {
      emit(const SignInFailure());
    }
  }

  Future<void> _onSignOut(SignOutRequired event, Emitter<SignInState> emit) async {
    await _userRepository.signOut();
    emit(SignInInitial());
  }
}
