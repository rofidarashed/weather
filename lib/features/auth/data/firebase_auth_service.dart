import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth;

  FirebaseAuthService({FirebaseAuth? auth})
    : _auth = auth ?? FirebaseAuth.instance;

  static const Map<String, String> _errorMessages = {
    'user-not-found': 'Invalid email or password',
    'wrong-password': 'Invalid email or password',
    'invalid-email': 'Invalid email or password',
    'network-request-failed': 'Please check your internet connection',
  };

  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: _handleAuthError(e.code),
      );
    }
  }

  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: _handleAuthError(e.code),
      );
    }
  }

  String? _handleAuthError(String code) {
    return _errorMessages[code] ?? 'An unknown error occurred';
  }
}
