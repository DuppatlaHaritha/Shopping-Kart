import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:typed_data';

class ApiService {
  // Base URL for web
  static final String base = 'http://localhost:8081';
  // static final String base = 'http://13.202.70.247/poojaessentials';

  // =================== TOKEN MANAGEMENT ===================
  static Future<void> saveToken(String token) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString('jwt', token);
  }

  static Future<String?> getToken() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getString('jwt');
  }

  static Future<void> clearToken() async {
    final sp = await SharedPreferences.getInstance();
    await sp.remove('jwt');
  }

  // =================== BUILD HEADERS ===================
  static Future<Map<String, String>> _getHeaders({bool withAuth = false}) async {
    final headers = {'Content-Type': 'application/json'};

    if (withAuth) {
      final token = await getToken();

      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
        if (token == "mock_admin_token_123456") {
          print('🧪 Test token present — attaching mock token in Authorization header.');
        }
      } else {
        print('⚠️ Warning: No token found for authorized request.');
      }
    }

    return headers;
  }

  // =================== GET ===================
  static Future<http.Response> get(String path, {bool withAuth = false}) async {
    final uri = Uri.parse('$base$path');
    try {
      final headers = await _getHeaders(withAuth: withAuth);
      final res = await http.get(uri, headers: headers);
      print('GET ${uri.path} → ${res.statusCode}');
      return res;
    } catch (e) {
      print('GET request failed: $e');
      return http.Response('{"error":"Network error"}', 503);
    }
  }

  // =================== POST ===================
  static Future<http.Response> post(String path, Map body, {bool withAuth = false}) async {
    final uri = Uri.parse('$base$path');
    try {
      final headers = await _getHeaders(withAuth: withAuth);
      final res = await http.post(uri, headers: headers, body: jsonEncode(body));
      print('POST ${uri.path} → ${res.statusCode}');
      return res;
    } catch (e) {
      print('POST request failed: $e');
      return http.Response('{"error":"Network error"}', 503);
    }
  }

  // =================== UPLOAD FILE ===================
  static Future<http.Response> uploadFile(
      String path,
      Uint8List fileBytes,
      String fileName, {
        bool withAuth = false,
        String? token,
      }) async {
    var uri = Uri.parse('$base$path');
    var request = http.MultipartRequest('POST', uri);

    request.files.add(http.MultipartFile.fromBytes(
      'image',
      fileBytes,
      filename: fileName,
    ));

    if (withAuth) {
      final authToken = token ?? await getToken();

      if (authToken != null && authToken.isNotEmpty) {
        request.headers['Authorization'] = 'Bearer $authToken';
        if (authToken == "mock_admin_token_123456") {
          print('🧪 Test token present — uploading with mock token header.');
        }
      } else {
        print('⚠️ Warning: No token found while uploading image.');
      }
    }

    var streamedResponse = await request.send();
    var res = await http.Response.fromStream(streamedResponse);
    print('UPLOAD ${uri.path} → ${res.statusCode}');
    return res;
  }

  // =================== CREATE PRODUCT ===================
  static Future<http.Response> createProduct({
    required String name,
    required String description,
    required double price,
    int? categoryId,
    String? imagePath,
    bool withAuth = false,
  }) async {
    final body = {
      "name": name,
      "description": description,
      "price": price,
      if (categoryId != null) "categoryId": categoryId,
      if (imagePath != null) "imagePath": imagePath,
    };
    return await post("/api/admin/products", body, withAuth: withAuth);
  }

  // =================== PUT ===================
  static Future<http.Response> put(String path, Map body, {bool withAuth = false}) async {
    final uri = Uri.parse('$base$path');
    try {
      final headers = await _getHeaders(withAuth: withAuth);
      final res = await http.put(uri, headers: headers, body: jsonEncode(body));
      print('PUT ${uri.path} → ${res.statusCode}');
      return res;
    } catch (e) {
      print('PUT request failed: $e');
      return http.Response('{"error":"Network error"}', 503);
    }
  }

  // =================== DELETE ===================
  static Future<http.Response> delete(String path, {bool withAuth = false}) async {
    final uri = Uri.parse('$base$path');
    try {
      final headers = await _getHeaders(withAuth: withAuth);
      final res = await http.delete(uri, headers: headers);
      print('DELETE ${uri.path} → ${res.statusCode}');
      return res;
    } catch (e) {
      print('DELETE request failed: $e');
      return http.Response('{"error":"Network error"}', 503);
    }
  }

  // =================== PASSWORD METHODS ===================
  static Future<http.Response> updatePassword({
    required String username,
    required String password,
    required String newPassword,
    bool withAuth = true,
  }) async {
    final body = {
      "username": username,
      "password": password,
      "newPassword": newPassword,
    };
    return await put("/api/auth/change-password", body, withAuth: withAuth);
  }

  static Future<http.Response> resetPassword({
    required String username,
    required String newPassword,
  }) async {
    final body = {
      "username": username,
      "newPassword": newPassword,
    };
    return await post("/api/auth/reset-password", body);
  }
}