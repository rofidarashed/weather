import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather/core/utils/strings.dart';
import 'package:weather/features/auth/data/firebase_auth_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuthService _authService;

  AuthCubit(this._authService) : super(AuthInitial());

  Future<void> loginCubit({
    required String email,
    required String password,
  }) async {
    emit(AuthLoadingState());
    try {
      final user = await _authService.signIn(email: email, password: password);
      if (user != null) {
        emit(AuthLoginSuccess());
      } else {
        emit(AuthErrorState("User not found"));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorState(e.message ?? "Login failed"));
    }
  }

  Future<void> signupCubit({
    required String email,
    required String password,
    required String repeatPassword,
  }) async {
    if (email.isEmpty || password.isEmpty || repeatPassword.isEmpty) {
      emit(AuthErrorState(AppStrings.pleaseFillAllFields));
      return;
    }

    if (password != repeatPassword) {
      emit(AuthErrorState(AppStrings.passwordNotMatch));
      return;
    }

    emit(AuthLoadingState());

    try {
      final user = await _authService.signUp(email: email, password: password);
      if (user != null) {
        emit(AuthSignupSuccess());
      } else {
        emit(AuthErrorState(AppStrings.anUnexpectedErrorHasOccurred));
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          emit(AuthErrorState(AppStrings.passwordMustBeAtLeast6Characters));
          break;
        case 'email-already-in-use':
          emit(AuthErrorState(AppStrings.emailAlreadyExist));
          break;
        default:
          emit(AuthErrorState(AppStrings.anUnexpectedErrorHasOccurred));
      }
    }
  }


}
