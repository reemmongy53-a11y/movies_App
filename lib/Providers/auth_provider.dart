import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final SharedPreferences prefs;
  final AuthService _authService = AuthService();

  UserModel? _currentUser;
  bool _isLoading = false;

  AuthProvider(this.prefs) {
    _loadUser();
  }

  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _currentUser != null;

  void _loadUser() {
    final userData = prefs.getString('user');
    if (userData != null) {
      _currentUser = UserModel.fromJson(json.decode(userData));
      notifyListeners();
    }
  }

  Future<void> _saveUser(UserModel user) async {
    await prefs.setString('user', json.encode(user.toJson()));
    await prefs.setString('user_${user.id}', json.encode(user.toJson()));
    _currentUser = user;
    notifyListeners();
  }

  Future<bool> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String avatar,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Check if user already exists
      final existingUser = prefs.getString('email_$email');
      if (existingUser != null) {
        throw 'An account with this email already exists';
      }

      Map<String, String>? result = await _authService.signUpWithEmail(
        email: email,
        password: password,
      );

      if (result != null) {
        UserModel user = UserModel(
          id: result['uid']!,
          name: name,
          email: email,
          phone: phone,
          avatar: avatar,
        );

        // Save password hash for login verification
        await prefs.setString('email_$email', password);
        await _saveUser(user);

        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      rethrow;
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Verify credentials
      final savedPassword = prefs.getString('email_$email');
      if (savedPassword == null) {
        throw 'No user found with this email';
      }

      if (savedPassword != password) {
        throw 'Wrong password';
      }

      Map<String, String>? result = await _authService.signInWithEmail(
        email: email,
        password: password,
      );

      if (result != null) {
        final userData = prefs.getString('user_${result['uid']}');

        if (userData != null) {
          _currentUser = UserModel.fromJson(json.decode(userData));
        } else {
          _currentUser = UserModel(
            id: result['uid']!,
            name: 'User',
            email: result['email']!,
            phone: '',
            avatar: 'assets/avatars/avatar1.png',
          );
        }

        await _saveUser(_currentUser!);
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      rethrow;
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<void> updateUser({
    String? name,
    String? phone,
    String? avatar,
  }) async {
    if (_currentUser == null) return;

    _currentUser = _currentUser!.copyWith(
      name: name,
      phone: phone,
      avatar: avatar,
    );

    await _saveUser(_currentUser!);
  }

  Future<void> signOut() async {
    await _authService.signOut();
    await prefs.remove('user');
    _currentUser = null;
    notifyListeners();
  }

  Future<void> deleteAccount() async {
    if (_currentUser == null) return;

    await _authService.deleteAccount();
    await prefs.remove('user');
    await prefs.remove('user_${_currentUser!.id}');
    await prefs.remove('email_${_currentUser!.email}');
    _currentUser = null;
    notifyListeners();
  }

  void addToWatchList(int movieId) {
    if (_currentUser == null) return;

    List<int> watchList = List.from(_currentUser!.watchList);
    if (!watchList.contains(movieId)) {
      watchList.add(movieId);
      _currentUser = _currentUser!.copyWith(watchList: watchList);
      _saveUser(_currentUser!);
    }
  }

  void removeFromWatchList(int movieId) {
    if (_currentUser == null) return;

    List<int> watchList = List.from(_currentUser!.watchList);
    watchList.remove(movieId);
    _currentUser = _currentUser!.copyWith(watchList: watchList);
    _saveUser(_currentUser!);
  }

  void addToHistory(int movieId) {
    if (_currentUser == null) return;

    List<int> history = List.from(_currentUser!.history);
    if (!history.contains(movieId)) {
      history.add(movieId);
      _currentUser = _currentUser!.copyWith(history: history);
      _saveUser(_currentUser!);
    }
  }

  bool isInWatchList(int movieId) {
    return _currentUser?.watchList.contains(movieId) ?? false;
  }
}