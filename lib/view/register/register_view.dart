import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_or_mvvm_pattern/res/colors/app_color.dart';
import 'package:mvc_or_mvvm_pattern/res/components/custom_button.dart';
import 'package:mvc_or_mvvm_pattern/utils/utils.dart';
import 'package:mvc_or_mvvm_pattern/view/login/login_view.dart';

import '../../view_models/controllers/register/register_view_model.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewModel _registerViewModel = Get.put(RegisterViewModel());
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('register'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _registerViewModel.emailController.value,
                //focusNode: _loginViewModel.emailFocusNode.value,
                decoration: InputDecoration(
                    hintText: 'email_hint'.tr,
                    hintStyle: TextStyle(
                        color: AppColor.secondaryTextColor.withOpacity(0.5)),
                    border: const OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return Utils.snackBar('Email', 'Please enter your email');
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _registerViewModel.passwordController.value,
                //focusNode: _loginViewModel.passwordFocusNode.value,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'password_hint'.tr,
                    hintStyle: TextStyle(
                        color: AppColor.secondaryTextColor.withOpacity(0.5)),
                    border: const OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return Utils.toastMessage('Please enter your password');
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              CustomButton(
                  title: 'register'.tr,
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      _registerViewModel.registerApi();
                    }
                  },
                  // width: double.infinity,
                ),

              TextButton(
                onPressed: () {
                  Get.to(() => const LoginView());
                },
                child: const Text('Login here'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
