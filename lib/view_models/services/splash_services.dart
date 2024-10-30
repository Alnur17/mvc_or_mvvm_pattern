import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mvc_or_mvvm_pattern/res/routes/routes_name.dart';
import 'package:mvc_or_mvvm_pattern/view_models/controllers/user_preference/user_preference_view_model.dart';

class SplashServices {
  final UserPreference _userPreference = UserPreference();

  void isLogin() {
    _userPreference.getUser().then(
      (value) {
        if (kDebugMode) {
          print(value.token);
          print(value.isLogin);
        }

        if (value.isLogin == false || value.isLogin == null) {
          Timer(
            const Duration(seconds: 3),
            () => Get.offAndToNamed(RoutesName.loginView),
          );
        } else {
          Timer(
            const Duration(seconds: 3),
            () => Get.offAndToNamed(RoutesName.homeView),
          );
        }
      },
    );
  }
}
