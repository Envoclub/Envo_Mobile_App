import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';
import '../utils/meta_strings.dart';

class AuthRepository {
 String? accessToken;
 String? refreshToken;
  FlutterSecureStorage storage = FlutterSecureStorage();
  initTokens() async {
    accessToken = await storage.read(key: "accessToken");
    refreshToken = await storage.read(key: "refreshToken");
  }

  setTokens(String accessTokenValue, String refreshTokenValue) async {
    accessToken = accessTokenValue;
    refreshToken = refreshTokenValue;
    log("access $accessToken refresh $refreshToken");
    await storage.write(key: "accessToken", value: accessToken);
    await storage.write(key: "refreshToken", value: refreshToken);
  }

  login(String email, String password) async {
    var params = {"email": email, "password": password};
    var headers = {
 
      "Content-Type": "application/json"
    };
    try {
      String url = MetaStrings.baseUrl + MetaStrings.loginEndPoint;
      log(url);
      var response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(params));
      var parsedValue = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        await setTokens(parsedValue["access"], parsedValue["refresh"]);
        return;
      } else {
        throw parsedValue['detail'];
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  getUserDetails() async {
    var headers = {
      "Authorization": "Token " + accessToken!,
      "Content-type": "application/json"
    };
    log(headers.toString());
    try {
      String url = MetaStrings.baseUrl + MetaStrings.getUserEndPoint;
      log(url);

      FlutterSecureStorage storage = FlutterSecureStorage();
      var response = await http.get(Uri.parse(url), headers: headers);
      debugPrint(response.body);
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  logout() async {
    try {
      await storage.deleteAll();
      return;
    } catch (e) {
      rethrow;
    }
  }
}
