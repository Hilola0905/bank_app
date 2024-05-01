
import 'package:bank_app/utils/size/screen_utils.dart';
import 'package:flutter/material.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/style/app_text_style.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function() onTap;

  const RoundedButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.w),

          ),
        ),
        child: Text(
          text,
          style: AppTextStyle.interBold.copyWith(color: AppColors.white),
        ));
  }
}
