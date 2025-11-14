/*import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? get token => _token;

  Future<bool> login(String username, String password) async {
    final res = await ApiService.post('/api/auth/login', {'username': username, 'password': password});
    if (res.statusCode == 200) {
      final j = jsonDecode(res.body);
      _token = j['token'];
      await ApiService.saveToken(_token!);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> register(String username, String password) async {
    final res = await ApiService.post('/api/auth/register', {'username': username, 'password': password});
    return res.statusCode == 200;
  }

  Future<void> logout() async {
    _token = null;
    final sp = await SharedPreferences.getInstance();
    await sp.remove('jwt');
    notifyListeners();
  }
}*/

//27-10-2025 working before any modifications
/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? get token => _token;

  // Login with username/password
  Future<bool> login(String username, String password) async {
    try {
      final res = await ApiService.post(
        '/api/auth/login',
        {
          'username': username, // must match backend
          'password': password, // must match backend
        },
      );

      if (res.statusCode == 200) {
        final j = jsonDecode(res.body);
        _token = j['token'];

        // Save JWT in shared preferences
        final sp = await SharedPreferences.getInstance();
        await sp.setString('jwt', _token!);

        notifyListeners();
        return true;
      }
    } catch (e) {
      print("Login error: $e");
    }
    return false;
  }

  // Register
  Future<bool> register(String username, String password) async {
    final res = await ApiService.post(
      '/api/auth/register',
      {'username': username, 'password': password},
    );
    return res.statusCode == 200;
  }

  // Logout
  Future<void> logout() async {
    _token = null;
    final sp = await SharedPreferences.getInstance();
    await sp.remove('jwt');
    notifyListeners();
  }
}

*/
/*
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';
import 'dart:convert';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? _userRole;
  String? _username;

  String? get token => _token;
  String? get userRole => _userRole;
  String? get username => _username;

  bool get isAuthenticated => _token != null;

  Future<void> login(String username, String password) async {
    final response = await ApiService.post('/api/auth/login', {
      'username': username,
      'password': password,
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      _token = data['token'];
      _userRole = data['role']; // store role
      _username = data['username'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', _token!);
      await prefs.setString('role', _userRole ?? '');
      await prefs.setString('username', _username ?? '');

      notifyListeners();
    } else {
      throw Exception('Login failed');
    }
  }

  /// ✅ Fix: Add loadUserData()
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    _userRole = prefs.getString('role');
    _username = prefs.getString('username');
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _token = null;
    _userRole = null;
    _username = null;
    notifyListeners();
  }
}
*/
/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? _userRole;
  String? _username;

  String? get token => _token;
  String? get userRole => _userRole;
  String? get username => _username;
  bool get isAuthenticated => _token != null;

  /// ✅ Login method returns bool for success/failure
  Future<bool> login(String username, String password) async {
    final response = await ApiService.post('/api/auth/login', {
      'username': username,
      'password': password,
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      _token = data['token'];
      _userRole = data['role'];
      _username = data['username'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', _token ?? '');
      await prefs.setString('role', _userRole ?? '');
      await prefs.setString('username', _username ?? '');

      notifyListeners();
      return true; // ✅ success
    } else {
      return false; // ❌ invalid
    }
  }

  /// ✅ Load user data when app starts
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    _userRole = prefs.getString('role');
    _username = prefs.getString('username');
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _token = null;
    _userRole = null;
    _username = null;
    notifyListeners();
  }
}
*/
/*import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;
  String? _username;
  String? _userRole;

  String? get token => _token;
  String? get username => _username;
  String? get userRole => _userRole;

  bool get isLoggedIn => _token != null && _token!.isNotEmpty;

  /// ✅ LOGIN
  Future<bool> login(String username, String password) async {
    try {
      final response = await ApiService.post('/auth/login', {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _token = data['token'];
        _username = username;
        _userRole = data['role'];

        // ✅ Save user data locally
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', _token!);
        await prefs.setString('username', _username!);
        await prefs.setString('role', _userRole ?? '');

        notifyListeners();
        return true;
      } else {
        debugPrint('Login failed: ${response.body}');
        return false;
      }
    } catch (e) {
      debugPrint('Login error: $e');
      return false;
    }
  }

  /// ✅ REGISTER
  Future<bool> register(String username, String password) async {
    try {
      final response = await ApiService.post('/auth/register', {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint('Registration successful for $username');
        return true;
      } else {
        debugPrint('Registration failed: ${response.body}');
        return false;
      }
    } catch (e) {
      debugPrint('Register error: $e');
      return false;
    }
  }

  /// ✅ LOGOUT
  Future<void> logout() async {
    _token = null;
    _username = null;
    _userRole = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    notifyListeners();
  }

  /// ✅ LOAD SAVED USER DATA
  Future<void> loadUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _token = prefs.getString('token');
      _username = prefs.getString('username');
      _userRole = prefs.getString('role');
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading user data: $e');
    }
  }

  /// ✅ CLEAR DATA (Optional utility)
  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('username');
    await prefs.remove('role');
    _token = null;
    _username = null;
    _userRole = null;
    notifyListeners();
  }
}
*/

/*import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? get token => _token;

  String? _userRole; // ✅ added field
  String? get userRole => _userRole; // ✅ added getter

  // Login with username/password
  Future<bool> login(String username, String password) async {
    try {
      final res = await ApiService.post(
        '/api/auth/login',
        {
          'username': username, // must match backend
          'password': password, // must match backend
        },
      );

      if (res.statusCode == 200) {
        final j = jsonDecode(res.body);
        _token = j['token'];
        _userRole = j['role']; // ✅ store role from backend response

        // Save JWT and role in shared preferences
        final sp = await SharedPreferences.getInstance();
        await sp.setString('jwt', _token!);
        if (_userRole != null) {
          await sp.setString('userRole', _userRole!);
        }

        notifyListeners();
        return true;
      }
    } catch (e) {
      print("Login error: $e");
    }
    return false;
  }

  // Register
  Future<bool> register(String username, String password) async {
    final res = await ApiService.post(
      '/api/auth/register',
      {'username': username, 'password': password},
    );
    return res.statusCode == 200;
  }

  // Logout
  Future<void> logout() async {
    _token = null;
    _userRole = null; // ✅ clear role on logout
    final sp = await SharedPreferences.getInstance();
    await sp.remove('jwt');
    await sp.remove('userRole');
    notifyListeners();
  }
}
*/
/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? _role;

  String? get token => _token;
  String? get userRole => _role;

  // ✅ Login with username/password
  Future<bool> login(String username, String password) async {
    try {
      final res = await ApiService.post(
        '/api/auth/login',
        {
          'username': username,
          'password': password,
        },
      );

      if (res.statusCode == 200) {
        final j = jsonDecode(res.body);
        _token = j['token'];
        _role = j['role']; // ✅ store role

        // ✅ Save both JWT and role in shared preferences
        final sp = await SharedPreferences.getInstance();
        await sp.setString('jwt', _token!);
        if (_role != null) await sp.setString('role', _role!);

        notifyListeners();
        return true;
      }
    } catch (e) {
      print("Login error: $e");
    }
    return false;
  }

  // ✅ Load token + role from SharedPreferences
  Future<void> loadUserData() async {
    final sp = await SharedPreferences.getInstance();
    _token = sp.getString('jwt');
    _role = sp.getString('role');
    notifyListeners();
  }

  // ✅ Register
  Future<bool> register(String username, String password) async {
    final res = await ApiService.post(
      '/api/auth/register',
      {'username': username, 'password': password},
    );
    return res.statusCode == 200;
  }

  // ✅ Logout
  Future<void> logout() async {
    _token = null;
    _role = null;
    final sp = await SharedPreferences.getInstance();
    await sp.remove('jwt');
    await sp.remove('role');
    notifyListeners();
  }
}
*/
/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? _userRole; // ✅ Added field to store role
  String? get token => _token;
  String? get userRole => _userRole; // ✅ Added getter

  // ✅ Load saved token & role at app startup
  Future<void> loadUserData() async {
    final sp = await SharedPreferences.getInstance();
    _token = sp.getString('jwt');
    _userRole = sp.getString('role'); // load role
    notifyListeners();
  }

  // Login with username/password
  Future<bool> login(String username, String password) async {
    try {
      final res = await ApiService.post(
        '/api/auth/login',
        {
          'username': username,
          'password': password,
        },
      );

      if (res.statusCode == 200) {
        final j = jsonDecode(res.body);
        _token = j['token'];
        _userRole = j['role']; // ✅ store role from backend

        // Save JWT & role in shared preferences
        final sp = await SharedPreferences.getInstance();
        await sp.setString('jwt', _token!);
        if (_userRole != null) {
          await sp.setString('role', _userRole!);
        }

        notifyListeners();
        return true;
      }
    } catch (e) {
      print("Login error: $e");
    }
    return false;
  }

  // Register
  Future<bool> register(String username, String password) async {
    final res = await ApiService.post(
      '/api/auth/register',
      {'username': username, 'password': password},
    );
    return res.statusCode == 200;
  }

  // Logout
  Future<void> logout() async {
    _token = null;
    _userRole = null; // ✅ clear role
    final sp = await SharedPreferences.getInstance();
    await sp.remove('jwt');
    await sp.remove('role');
    notifyListeners();
  }
}
*/
/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? get token => _token;

  String? _userRole; // ✅ added field
  String? get userRole => _userRole; // ✅ added getter

  // ✅ Load saved JWT and role (called at app startup)
  Future<void> loadUserData() async {
    final sp = await SharedPreferences.getInstance();
    _token = sp.getString('jwt');
    _userRole = sp.getString('userRole');
    notifyListeners();
  }

  // Login with username/password
  Future<bool> login(String username, String password) async {
    try {
      final res = await ApiService.post(
        '/api/auth/login',
        {
          'username': username, // must match backend
          'password': password, // must match backend
        },
      );

      if (res.statusCode == 200) {
        final j = jsonDecode(res.body);
        _token = j['token'];
        _userRole = j['role']; // ✅ store role from backend response

        // Save JWT and role in shared preferences
        final sp = await SharedPreferences.getInstance();
        await sp.setString('jwt', _token!);
        if (_userRole != null) {
          await sp.setString('userRole', _userRole!);
        }

        notifyListeners();
        return true;
      }
    } catch (e) {
      print("Login error: $e");
    }
    return false;
  }

  // Register
  Future<bool> register(String username, String password) async {
    final res = await ApiService.post(
      '/api/auth/register',
      {'username': username, 'password': password},
    );
    return res.statusCode == 200;
  }

  // Logout
  Future<void> logout() async {
    _token = null;
    _userRole = null; // ✅ clear role on logout
    final sp = await SharedPreferences.getInstance();
    await sp.remove('jwt');
    await sp.remove('userRole');
    notifyListeners();
  }
}
*/
/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? get token => _token;

  String? _userRole; // ✅ store user role (e.g., ROLE_USER / ROLE_ADMIN)
  String? get userRole => _userRole;

  // ✅ New: check if user is admin
  bool get isAdmin => _userRole == "ROLE_ADMIN";

  // ✅ Login method
  Future<bool> login(String username, String password) async {
    try {
      final res = await ApiService.post(
        '/api/auth/login',
        {
          'username': username,
          'password': password,
        },
      );

      if (res.statusCode == 200) {
        final j = jsonDecode(res.body);
        _token = j['token'];
        _userRole = j['role']; // ✅ store user role (ROLE_ADMIN / ROLE_USER)

        // ✅ Save JWT & role in shared preferences
        final sp = await SharedPreferences.getInstance();
        await sp.setString('jwt', _token!);
        if (_userRole != null) {
          await sp.setString('userRole', _userRole!);
        }

        notifyListeners();
        return true;
      }
    } catch (e) {
      print("Login error: $e");
    }
    return false;
  }

  // ✅ Register method
  Future<bool> register(String username, String password) async {
    final res = await ApiService.post(
      '/api/auth/register',
      {'username': username, 'password': password},
    );
    return res.statusCode == 200;
  }

  // ✅ Load user data (token + role) from SharedPreferences
  Future<void> loadUserData() async {
    final sp = await SharedPreferences.getInstance();
    _token = sp.getString('jwt');
    _userRole = sp.getString('userRole');
    notifyListeners();
  }

  // ✅ Logout
  Future<void> logout() async {
    _token = null;
    _userRole = null;
    final sp = await SharedPreferences.getInstance();
    await sp.remove('jwt');
    await sp.remove('userRole');
    notifyListeners();
  }
}
*/

/*
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? get token => _token;

  String? _userRole; // ✅ store user role (e.g., ROLE_USER / ROLE_ADMIN)
  String? get userRole => _userRole;

  // ✅ New: check if user is admin
  bool get isAdmin => _userRole == "ROLE_ADMIN";

  // ================== LOGIN ==================
  Future<bool> login(String username, String password) async {
    try {
      final res = await ApiService.post(
        '/api/auth/login',
        {
          'username': username,
          'password': password,
        },
      );

      if (res.statusCode == 200) {
        final j = jsonDecode(res.body);
        _token = j['token'];
        _userRole = j['role']; // ✅ store user role (ROLE_ADMIN / ROLE_USER)

        // ✅ Save JWT & role in shared preferences
        final sp = await SharedPreferences.getInstance();
        await sp.setString('jwt', _token!);
        if (_userRole != null) {
          await sp.setString('userRole', _userRole!);
        }

        notifyListeners();
        return true;
      }
    } catch (e) {
      print("Login error: $e");
    }
    return false;
  }

  // ================== REGISTER ==================
  Future<bool> register(String username, String password) async {
    final res = await ApiService.post(
      '/api/auth/register',
      {'username': username, 'password': password},
    );
    return res.statusCode == 200;
  }

  // ================== LOAD USER DATA ==================
  Future<void> loadUserData() async {
    final sp = await SharedPreferences.getInstance();
    _token = sp.getString('jwt');
    _userRole = sp.getString('userRole');
    notifyListeners();
  }

  // ================== LOGOUT ==================
  Future<void> logout() async {
    _token = null;
    _userRole = null;
    final sp = await SharedPreferences.getInstance();
    await sp.remove('jwt');
    await sp.remove('userRole');
    notifyListeners();
  }

  // ======================================================
  // ✅ UPDATE PASSWORD (NEW FEATURE)
  // ======================================================
  Future<String> updatePassword({
    required String username,
    required String password,
    required String newPassword,
  }) async {
    try {
      final res = await ApiService.updatePassword(
        username: username,
        password: password,
        newPassword: newPassword,
        withAuth: true,
      );

      if (res.statusCode == 200) {
        print("✅ Password updated successfully");
        return "Password updated successfully";
      } else if (res.statusCode == 400) {
        print("⚠️ Incorrect old password");
        return "Incorrect old password";
      } else {
        print("⚠️ Password update failed: ${res.statusCode}");
        return "Password update failed";
      }
    } catch (e) {
      print("❌ Error updating password: $e");
      return "Network error, please try again.";
    }
  }


  // ======================================================
// ✅ RESET PASSWORD (without old password)
// ======================================================
  Future<String> resetPassword({
    required String username,
    required String newPassword,
  }) async {
    try {
      final res = await ApiService.resetPassword(
        username: username,
        newPassword: newPassword,
      );

      if (res.statusCode == 200) {
        print("✅ Password reset successfully");
        return "Password reset successfully";
      } else if (res.statusCode == 404) {
        print("⚠️ User not found");
        return "User not found";
      } else {
        print("⚠️ Password reset failed: ${res.statusCode}");
        return "Password reset failed";
      }
    } catch (e) {
      print("❌ Error resetting password: $e");
      return "Network error, please try again.";
    }
  }
}
*/


import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? get token => _token;

  String? _userRole; // ✅ store user role (e.g., ROLE_USER / ROLE_ADMIN / ROLE_SALES)
  String? get userRole => _userRole;

  // ✅ New: check if user is admin
  bool get isAdmin => _userRole == "ROLE_ADMIN";

  // ================== LOGIN ==================
  Future<bool> login(String username, String password) async {
    try {
      final res = await ApiService.post(
        '/api/auth/login',
        {
          'username': username,
          'password': password,
        },
      );

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);

        _token = data['token'];
        _userRole = data['role']; // ✅ store user role (ROLE_ADMIN / ROLE_USER / ROLE_SALES)

        // ✅ Save JWT & role in shared preferences (your new code)
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('role', data['role']); // e.g. "ROLE_SALES"
        prefs.setString('token', data['token']); // store token locally

        // ✅ Also store for backward compatibility
        await prefs.setString('jwt', _token!);
        if (_userRole != null) {
          await prefs.setString('userRole', _userRole!);
        }

        notifyListeners();
        return true;
      }
    } catch (e) {
      print("Login error: $e");
    }
    return false;
  }

  // ================== REGISTER ==================
  Future<bool> register(String username, String password) async {
    final res = await ApiService.post(
      '/api/auth/register',
      {'username': username, 'password': password},
    );
    return res.statusCode == 200;
  }

  // ================== LOAD USER DATA ==================
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('jwt') ?? prefs.getString('token');
    _userRole = prefs.getString('userRole') ?? prefs.getString('role');
    notifyListeners();
  }

  // ================== LOGOUT ==================
  Future<void> logout() async {
    _token = null;
    _userRole = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt');
    await prefs.remove('userRole');
    await prefs.remove('token');
    await prefs.remove('role');
    notifyListeners();
  }

  // ======================================================
  // ✅ UPDATE PASSWORD (NEW FEATURE)
  // ======================================================
  Future<String> updatePassword({
    required String username,
    required String password,
    required String newPassword,
  }) async {
    try {
      final res = await ApiService.updatePassword(
        username: username,
        password: password,
        newPassword: newPassword,
        withAuth: true,
      );

      if (res.statusCode == 200) {
        print("✅ Password updated successfully");
        return "Password updated successfully";
      } else if (res.statusCode == 400) {
        print("⚠️ Incorrect old password");
        return "Incorrect old password";
      } else {
        print("⚠️ Password update failed: ${res.statusCode}");
        return "Password update failed";
      }
    } catch (e) {
      print("❌ Error updating password: $e");
      return "Network error, please try again.";
    }
  }

  // ======================================================
  // ✅ RESET PASSWORD (without old password)
  // ======================================================
  Future<String> resetPassword({
    required String username,
    required String newPassword,
  }) async {
    try {
      final res = await ApiService.resetPassword(
        username: username,
        newPassword: newPassword,
      );

      if (res.statusCode == 200) {
        print("✅ Password reset successfully");
        return "Password reset successfully";
      } else if (res.statusCode == 404) {
        print("⚠️ User not found");
        return "User not found";
      } else {
        print("⚠️ Password reset failed: ${res.statusCode}");
        return "Password reset failed";
      }
    } catch (e) {
      print("❌ Error resetting password: $e");
      return "Network error, please try again.";
    }
  }
}
