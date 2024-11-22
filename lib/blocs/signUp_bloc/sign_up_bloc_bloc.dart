import 'package:bloc/bloc.dart';
import 'package:local_events/blocs/signUp_bloc/sign_up_bloc_event.dart';
import 'package:local_events/blocs/signUp_bloc/sign_up_bloc_state.dart';
import 'package:local_events/repositories/user_repository/user_model.dart';
import 'package:local_events/repositories/user_repository/user_repository.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
	final UserRepository _userRepository;

  SignUpBloc({
		required UserRepository userRepository
	}) : _userRepository = userRepository,
		super(SignUpInitial()) {
    on<SignUpRequired>((event, emit) async {
			emit(SignUpProcess());
			try {
        User user = await _userRepository.signUp(event.user, email: '', password: '');
				await _userRepository.setUserData(user);
				emit(SignUpSuccess());
      } catch (e) {
				emit(SignUpFailure());
      }
    });
  }
}