import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvc_or_mvvm_pattern/repository/login_repository/login_repository.dart';
import 'package:mvc_or_mvvm_pattern/utils/utils.dart';

class LoginViewModel extends GetxController{

  final LoginRepository _api = LoginRepository();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  // final emailFocusNode = FocusNode().obs;
  // final passwordFocusNode = FocusNode().obs;

  final RxBool isLoading = false.obs;


void loginApi(){
  isLoading.value = true;

  Map data = {
    'email': emailController.value.text,
    'password': passwordController.value.text,
  };

  _api.loginApi(data).then((value) {
    isLoading.value = false;
    Utils.snackBar('Success', 'Login successful',);
  },).onError((error, stackTrace) {
    isLoading.value = false;
    Utils.snackBar('Error', error.toString(),);
  },);
}
}