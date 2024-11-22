import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:local_events/repositories/user_repository/user_model.dart';

// Define events
abstract class MyUserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadUser extends MyUserEvent {
  final String userId;

  LoadUser(this.userId);

  @override
  List<Object?> get props => [userId];
}

// Define states
abstract class MyUserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MyUserInitial extends MyUserState {}

class MyUserLoading extends MyUserState {}

class MyUserLoaded extends MyUserState {
  final User user;

  MyUserLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

class MyUserError extends MyUserState {
  final String error;

  MyUserError(this.error);

  @override
  List<Object?> get props => [error];
}

// The Bloc itself
class MyUserBloc extends Bloc<MyUserEvent, MyUserState> {
  MyUserBloc() : super(MyUserInitial()) {
    on<LoadUser>(_onLoadUser);
  }

  Future<void> _onLoadUser(LoadUser event, Emitter<MyUserState> emit) async {
    emit(MyUserLoading());
    try {
      // Simulate fetching user data
      await Future.delayed(const Duration(seconds: 2));
      // Replace this with actual logic to fetch user
      final user = User(
        id: event.userId,
        email: "user@example.com",
        displayName: "John Doe",
      );
      emit(MyUserLoaded(user));
    } catch (error) {
      emit(MyUserError("Failed to load user: $error"));
    }
  }
}
