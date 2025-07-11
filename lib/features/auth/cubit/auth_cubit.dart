import 'package:bloc/bloc.dart';
import 'package:weather/features/auth/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  bool pending = false;

  loginCubit() {
    emit(AuthLoadingState());
    pending = true;
    emit(AuthLoginSuccess());

  }
}
