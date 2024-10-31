import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/components/custom_button.dart';
import '../../../view_models/controllers/login/login_view_model.dart';

class LoginButtonWidget extends StatelessWidget {
  final dynamic formKey;
  LoginButtonWidget({super.key, required this.formKey});

  final LoginViewModel _loginViewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomButton(
        title: 'login'.tr,
        loading: _loginViewModel.isLoading.value,
        onPress: () {
          if (formKey.currentState!.validate()) {
            _loginViewModel.loginApi();
          }else{
            return;
          }
        },
        width: double.infinity,
      ),
    );
  }
}
