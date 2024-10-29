import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_or_mvvm_pattern/res/colors/app_color.dart';
import 'package:mvc_or_mvvm_pattern/res/fonts/app_fonts.dart';

class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  State<InternetExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          SizedBox(height: height * 0.01),
          const Icon(
            Icons.cloud_download,
            color: AppColor.redColor,
          ),
          SizedBox(height: height * 0.01),
          Text('internet_exception'.tr),
          SizedBox(height: height * 0.1),
          InkWell(
            child: Container(
              height: height * .06,
              width: width * 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColor.primaryButtonColor,
              ),
              child: const Center(
                  child: Text(
                'Retry',
                style: TextStyle(
                  color: AppColor.whiteColor,
                  fontFamily: AppFonts.robotoBold
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
