import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_or_mvvm_pattern/res/colors/app_color.dart';
import 'package:mvc_or_mvvm_pattern/res/components/custom_button.dart';
import 'package:mvc_or_mvvm_pattern/utils/utils.dart';
import 'package:mvc_or_mvvm_pattern/view_models/controllers/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
   final LoginViewModel _loginViewModel = Get.put(LoginViewModel());
   final GlobalKey<FormState> _formKey= GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('login'.tr),
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
              controller: _loginViewModel.emailController.value,
              //focusNode: _loginViewModel.emailFocusNode.value,
              decoration: InputDecoration(
                  hintText: 'email_hint'.tr,
                  hintStyle:  TextStyle(color: AppColor.secondaryTextColor.withOpacity(0.5)),
                  border: const OutlineInputBorder()
              ),
                validator: (value) {
                  if(value!.isEmpty){
                    return Utils.snackBar('Email', 'Please enter your email');
                  }
                  return null;
                },
            ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _loginViewModel.passwordController.value,
                //focusNode: _loginViewModel.passwordFocusNode.value,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'password_hint'.tr,
                  hintStyle:  TextStyle(color: AppColor.secondaryTextColor.withOpacity(0.5)),
                  border: const OutlineInputBorder()
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return Utils.toastMessage('Please enter your password');
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              CustomButton(
                title: 'login'.tr,
                onPress: () {
                  if(_formKey.currentState!.validate()){
                    _loginViewModel.loginApi();
                  }
                },
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
