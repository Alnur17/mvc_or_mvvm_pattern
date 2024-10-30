import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvc_or_mvvm_pattern/models/login/user_model.dart';
import 'package:mvc_or_mvvm_pattern/res/routes/routes_name.dart';
import 'package:mvc_or_mvvm_pattern/utils/utils.dart';
import 'package:mvc_or_mvvm_pattern/view_models/controllers/user_preference/user_preference_view_model.dart';

import '../../../repository/login/login_repository.dart';

class LoginViewModel extends GetxController {
  final UserPreference _userPreference = UserPreference();

  final LoginRepository _api = LoginRepository();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  // final emailFocusNode = FocusNode().obs;
  // final passwordFocusNode = FocusNode().obs;

  final RxBool isLoading = false.obs;

  void loginApi() {
    isLoading.value = true;

    Map<String, dynamic> data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };

    _api.loginApi(data).then(
      (value) {
        isLoading.value = false;
        UserModel userModel = UserModel(
          token: value['token'],
          isLogin: true,
        );
        _userPreference.saveUser(userModel).then((_) {
          Get.toNamed(RoutesName.homeView);
        });
        Utils.snackBar(
          'Success',
          'Login successful',
        );
      },
    ).onError(
      (error, stackTrace) {
        isLoading.value = false;
        Utils.snackBar(
          'Error',
          error.toString(),
        );
      },
    );
  }
}
