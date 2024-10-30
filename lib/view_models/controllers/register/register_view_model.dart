import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/repository.dart';
import '../../../utils/utils.dart';

class RegisterViewModel extends GetxController{

  final Repository _api = Repository();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  // final emailFocusNode = FocusNode().obs;
  // final passwordFocusNode = FocusNode().obs;

  final RxBool isLoading = false.obs;


  void registerApi(){
    isLoading.value = true;

    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };

    _api.registerApi(data).then((value) {
      isLoading.value = false;
      Utils.snackBar('Success', 'Registration successful',);
    },).onError((error, stackTrace) {
      isLoading.value = false;
      Utils.snackBar('Error', error.toString(),);
    },);
  }
}