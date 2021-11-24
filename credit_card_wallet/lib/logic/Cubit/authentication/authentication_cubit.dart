import 'package:bloc/bloc.dart';
import 'package:credit_card_wallet/data/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationCubit({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(AuthenticationInitial());

  Future<void> login({required String email, required String password}) async {
    try {
      emit(AuthenticationLoading());
      await _userRepository.signInWithEmailAndPassword(email, password);
      emit(AuthenticationLoggedIn(user: _userRepository.getUser()));
    } catch (e) {
      emit(AuthenticationInitial());
    }
  }

  void resetPassword({required String email}) {
    _userRepository.resetPassword(email);
  }

  Future<void> logout() async {
    await _userRepository.signOut();
    emit(AuthenticationInitial());
  }

  void register({required String email, required String password}) async {
    try {
      emit(AuthenticationLoading());
      await _userRepository.signUpWithEmailAndPassword(email, password);
      emit(AuthenticationLoggedIn(user: _userRepository.getUser()));
    } catch (e) {
      emit(AuthenticationInitial());
    }
  }
}
