import 'dart:developer';

import 'package:envo_mobile/modules/home/binding.dart';
import 'package:envo_mobile/modules/tour/binding.dart';
import 'package:envo_mobile/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../models/user_model.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find<AuthController>();
  RxBool isFirstTime = false.obs;
  RxBool surveyComplete = false.obs;
  PageController pageController = PageController();
  RxBool loading = false.obs;
  RxBool authLoading = false.obs;
  Rxn<UserModel?> user = Rxn();
  AuthRepository authRepository = AuthRepository();
  FlutterSecureStorage storage = FlutterSecureStorage();
  @override
  void onInit() {
    super.onInit();
    authenticate();
  }

  authenticate() async {
    try {
      loading.value = true;
      isFirstTime.value = !((await storage.read(key: "isFirstTime")) != null);
      surveyComplete.value =
          ((await storage.read(key: "surveyComplete")) != null);

      if (isFirstTime.value) {
        loading.value = false;
      }
      if (!surveyComplete.value) {
        TourBinding().dependencies();
      }
      String? token = await storage.read(key: "accessToken");
      log("current access $token refresh");
      if (token != null) {
        UserModel? userModel = await authRepository.getUserDetails();
        user.value = userModel;
        HomeBinding().dependencies();
      } else {
        user.value = null;
      }
      loading.value = false;
    } catch (e) {
      loading.value = false;
      showSnackBar(e.toString());
    }
  }

  signIn(String email, String password) async {
    try {
      authLoading.value = true;
      await authRepository.login(email, password);
      authLoading.value = false;
      authenticate();
    } catch (e) {
      authLoading.value = false;
      showSnackBar(e.toString());
    }
  }

  logout() async {
    try {
      authLoading.value = true;
      await authRepository.logout();
      authLoading.value = false;
      await authenticate();
    } catch (e) {
      authLoading.value = false;
      showSnackBar(e.toString());
    }
  }

  completeSplash() async {
    try {
      await storage.write(key: "isFirstTime", value: "done");
      await authenticate();
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  completeSurvey() async {
    try {
      await storage.write(key: "surveyComplete", value: "done");
      await authenticate();
    } catch (e) {
      showSnackBar(e.toString());
    }
  }
}

showSnackBar(String message, {bool isError = true}) {
  Get.showSnackbar(GetSnackBar(
    duration: Duration(seconds: 3),
    backgroundColor: isError ? Colors.red : Colors.green,
    title: isError ? "Oops!" : "Success",
    message: message,
  ));
}
