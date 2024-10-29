import 'package:flutter/material.dart';
import 'package:mvc_or_mvvm_pattern/res/colors/app_color.dart';
import 'package:mvc_or_mvvm_pattern/res/fonts/app_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.loading = false,
    required this.title,
    required this.onPress,
    this.height = 60,
    this.width = 250,
    this.icon,
    this.textColor = AppColor.primaryTextColor,
    this.buttonColor = AppColor.primaryButtonColor,
  });

  final bool loading;
  final String title;
  final VoidCallback onPress;
  final double height, width;
  final Icon? icon;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: AppColor.whiteColor,
                    fontFamily: AppFonts.robotoBold,
                  ),
                ),
              ),
      ),
    );
  }
}
