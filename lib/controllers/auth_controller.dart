import 'package:egystore/constants/app_constants.dart';
import 'package:egystore/helper/dio_helper.dart';
import 'package:egystore/helper/helper.dart';
import 'package:egystore/models/user_model.dart';
import 'package:egystore/screens/IntroScreens/LoginScreen/login_screen.dart';
import 'package:egystore/screens/MainScreens/HomeScreen/home_screen.dart';
import 'package:egystore/screens/SharedComponents/getsnack_bars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  /// Text Editing Controller
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loading = false;
  UserModel userModel = UserModel();

  @override
  void onInit() {
    super.onInit();
    userNameController.clear();
    passwordController.clear();
  }

  Future<void> login() async {
    if (userNameController.text.isEmpty) {
      showError(body: 'usernameError');
      return;
    }
    if (passwordController.text.isEmpty) {
      showError(body: 'passwordError');
      return;
    }
    FocusScope.of(Get.context!).unfocus();
    loading = true;
    update();
    dynamic response = await DioHelper.post(
      url: AppConstants.loginEndPoint,
      parameters: {
        'email': userNameController.text.trim(),
        "password": passwordController.text,
      },
    );
    if (response == null || response == false) {
      loading = false;
      update();
      return;
    } else {
      loading = false;
      update();
      Helper.isLoggedIn = true;
      Helper.saveUserLoggedInSharedPreferences(true);
      Helper.saveUserTokenInSharedPreferences(response['token']);
      Helper.token = response['token'];
      userModel = UserModel.fromJson(response['user']);
      Helper.saveUserNameInSharedPreferences(userModel.name);
      Helper.userName = userModel.name;
      await DioHelper.init();
      Get.offAll(() => HomeScreen());
    }
  }

  Future<void> logout() async {
    loading = true;
    update();
    await Future.delayed(Duration(seconds: 1));
    Helper.isLoggedIn = false;
    Helper.saveUserLoggedInSharedPreferences(false);
    Helper.saveUserTokenInSharedPreferences('');
    Helper.token = '';
    loading = false;
    update();
    Get.offAll(() => LoginScreen());
  }
}
