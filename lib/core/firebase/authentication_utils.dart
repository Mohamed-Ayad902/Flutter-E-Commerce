import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce/core/utils/logger.dart';

/// Lightweight helper around `firebase_auth`.
///
/// - Keeps calls small and testable (accepts a FirebaseAuth instance).
/// - Returns `null` or `bool` on failures so caller can decide how to show errors.
/// - You can replace `print(...)` with your logger of choice.
class AuthenticationUtils {
  final FirebaseAuth _auth;

  AuthenticationUtils(this._auth);

  /// Change the current user's password.
  ///
  /// Returns `true` on success, `false` on failure (or if no signed-in user).
  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final user = _auth.currentUser;
    if (user == null || user.email == null) {
      if (kDebugMode) {
        print('changePassword: no signed-in user');
      }
      return false;
    }

    try {
      // Reauthenticate first (required by Firebase before sensitive ops).
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: currentPassword,
      );

      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);

      if (kDebugMode) {
        print('changePassword: password updated for ${user.uid}');
      }
      return true;
    } catch (e, s) {
      if (kDebugMode) {
        print('changePassword error: $e\n$s');
      }
      return false;
    }
  }

  /// Sign out the current user.
  /// Returns `true` if sign-out succeeded (i.e. no current user), otherwise `false`.
  Future<bool> logout() async {
    try {
      await _auth.signOut();
      return _auth.currentUser == null;
    } catch (e, s) {
      if (kDebugMode) {
        print('logout error: $e\n$s');
      }
      return false;
    }
  }

  /// Create a new user with email & password and send a verification email.
  ///
  /// Returns newly created userId on success, `null` on failure.
  Future<String?> createUser({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = result.user;
      if (user != null) {
        try {
          await user.sendEmailVerification();
            logWarning('Verification email sent to ${user.email}');
        } catch (e) {
            logError('sendVerificationEmail error: $e');
        }
        await _auth.signOut();
        return user.uid;
      }
      return null;
    } catch (e, s) {
        logInfo('createUser error: $e\n$s');
      return null;
    }
  }

  /// Returns whether current user's email is verified.
  ///
  /// Note: if you just changed verification state server-side, call `reloadCurrentUser()` first.
  bool isEmailVerified() {
    return _auth.currentUser?.emailVerified ?? false;
  }

  /// Optional helper to reload current user's data from Firebase.
  Future<void> reloadCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      await user.reload();
    }
  }

  /// Sign in with email & password.
  ///
  /// Returns the [User] if sign-in succeeded and email is verified, otherwise returns `null`.
  /// (Caller can show a message like "please verify your email" when `null` is returned.)
  Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = result.user;

      // If you require email verification, ensure user.isEmailVerified
      if (user != null && user.emailVerified) {
        return user;
      }

      // not verified -> sign out to keep state clean and return null
      if (user != null && !user.emailVerified) {
        await _auth.signOut();
        if (kDebugMode) {
          print('login: email not verified for ${user.uid}');
        }
      }

      return null;
    } catch (e, s) {
      if (kDebugMode) {
        print('login error: $e\n$s');
      }
      return null;
    }
  }

  /// Send password reset email. Throws if underlying Firebase call fails.
  Future<void> resetPassword(String email) {
    return _auth.sendPasswordResetEmail(email: email);
  }

  /// Return currently signed-in user's uid or null.
  String? getCurrentUserId() {
    final user = _auth.currentUser;
    if (user != null && user.emailVerified) return user.uid;
    return null;
  }
}
