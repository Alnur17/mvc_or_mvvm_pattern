import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_or_mvvm_pattern/res/assets/image_assets.dart';
import 'package:mvc_or_mvvm_pattern/res/fonts/app_fonts.dart';
import 'package:mvc_or_mvvm_pattern/utils/utils.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'email_hint'.tr,
        ),
      ),
      body: Column(
        children: [
          const Text(
            'Fonts check bold',
            style: TextStyle(
              fontFamily: AppFonts.robotoBold,
            ),
          ),
          Image.asset(ImageAssets.noImageIcon),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Utils.toastMessage(
          'message from toast bottom',
        );
        Utils.toastMessageCenter('message from toast center');
      }),
    );
  }
}
