class AuthService {
  Future<Map<String, String>?> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    return {
      'uid': DateTime.now().millisecondsSinceEpoch.toString(),
      'email': email,
    };
  }

  Future<Map<String, String>?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email.isEmpty || password.isEmpty) {
      throw 'Please enter email and password';
    }

    if (password.length < 6) {
      throw 'Password must be at least 6 characters';
    }

    return {
      'uid': email.hashCode.abs().toString(),
      'email': email,
    };
  }

  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> resetPassword(String email) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> deleteAccount() async {
    await Future.delayed(const Duration(milliseconds: 300));
  }
}
