
//dummy code not required
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final storage = FlutterSecureStorage();

// Future<void> login(String username, String password) async {
//   var apiUrl = 'http://10.182.2.189:8888/api/token/';
//
//   try{
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       body: ({
//         'username': username,
//         'password': password,
//       }),
//     );
//     if (response.statusCode == 200) {
//       final data= json.decode(response.body);
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString('access', data['access']);
//       await prefs.setString('refresh', data['refresh']);
//
//       catch (e) {
//         throw Exception('Failed to parse response: $e');
//       }
//     }
//
//   }
//
//
//
//   print('Response status: ${response.statusCode}');
//   print('Response body: ${response.body}');
//
//    else {
//     throw Exception('Failed to login. Status code: ${response.statusCode}, Response body: ${response.body}');
//   }
// }
// void checkStoredTokens() async {
//   final accessToken = await storage.read(key: 'access_token');
//   final refreshToken = await storage.read(key: 'refresh_token');
//   print('Stored Access Token: $accessToken');
//   print('Stored Refresh Token: $refreshToken');
// }