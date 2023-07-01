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
    var headers = {"Content-Type": "application/json"};
    try {
      String url = MetaStrings.baseUrl + MetaStrings.loginEndPoint;
      log(url);
      var response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(params));
      var parsedValue = jsonDecode(response.body);
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        await setTokens(parsedValue["key"], '');
        return;
      } else {
        throw parsedValue['detail'];
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  updateUserCo2(double value, int id) async {
    await storage.write(key: "surveyComplete", value: "done");
    await initTokens();
    var headers = {
      "Authorization": "Token ${accessToken!}",
      "Content-type": "application/json",
    };
    log(headers.toString());
    var params = {"co2": value};

    try {
      String url = "${MetaStrings.baseUrl}${MetaStrings.updateCo2}$id/values/";
      log(url);
      var response = await http.put(Uri.parse(url),
          headers: headers, body: jsonEncode(params));
      var parsedValue = jsonDecode(response.body);
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        throw parsedValue['detail'];
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  getUserDetails() async {
    await initTokens();
    var headers = {
      "Authorization": "Token " + accessToken!,
      "Content-type": "application/json"
    };
    log(headers.toString());
    try {
      String url = MetaStrings.baseUrl + MetaStrings.userDetails;
      log(url);

      FlutterSecureStorage storage = FlutterSecureStorage();
      var response = await http.get(Uri.parse(url), headers: headers);
      debugPrint(response.body);
      if (response.statusCode == 200) {
        return userModelFromJson(response.body).first;
      } else {
        throw jsonDecode(response.body)['message'];
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
