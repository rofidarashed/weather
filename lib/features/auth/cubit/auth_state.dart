sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthLoginSuccess extends AuthState {}

final class AuthSignupSuccess extends AuthState {}
