import 'dart:async';

import 'package:get/get.dart';
import 'package:mvc_or_mvvm_pattern/res/routes/routes_name.dart';
import 'package:mvc_or_mvvm_pattern/view_models/controllers/user_preference/user_preference_view_model.dart';

class SplashServices {
  final UserPreference _userPreference = UserPreference();

  void isLogin() {
    _userPreference.getUser().then(
      (value) {
        print(value.token);
        if (value.token!.isEmpty || value.token == 'null') {
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
