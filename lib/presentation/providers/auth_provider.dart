import 'package:flutter/material.dart';
import '../../core/services/firebase_service.dart';

class AuthProvider with ChangeNotifier {
  static const _allowedEmails = ['admin1@momo.com', 'admin2@chiku.com'];
  static const _allowedPasswords = ['2116rm', '2116mr'];

  bool _isLoggedIn = false;
  String? _error;

  bool get isLoggedIn => _isLoggedIn;
  String? get error => _error;

  Future<bool> login(String email, String password) async {
    if (!_allowedEmails.contains(email) || !_allowedPasswords.contains(password)) {
      _error = 'Access denied';
      notifyListeners();
      return false;
    }
    try {
      await FirebaseService.auth.signInWithEmailAndPassword(email: email, password: password);
      _isLoggedIn = true;
      _error = null;
      notifyListeners();
      return true;
    } catch (e) {
      _error = 'Login failed';
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    await FirebaseService.auth.signOut();
    _isLoggedIn = false;
    notifyListeners();
  }
}