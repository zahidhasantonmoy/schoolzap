import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '../../models/user.dart' as app_user;
import '../repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository());

final authStateChangesProvider = StreamProvider<firebase_auth.User?>((ref) {
  return ref.watch(authRepositoryProvider).user;
});

final currentUserProvider = FutureProvider<app_user.User?>((ref) async {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.getCurrentUser();
});

final authServiceProvider = Provider<AuthService>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthService(authRepository);
});

class AuthService {
  final AuthRepository _authRepository;

  AuthService(this._authRepository);

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _authRepository.signInWithEmailAndPassword(email, password);
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String role,
  }) async {
    await _authRepository.signUpWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
      role: role,
    );
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _authRepository.sendPasswordResetEmail(email);
  }
}