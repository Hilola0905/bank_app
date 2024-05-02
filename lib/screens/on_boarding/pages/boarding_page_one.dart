
import 'package:bank_app/utils/size/screen_utils.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/style/app_text_style.dart';


class BoardingPageOne extends StatelessWidget {
  const BoardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.img,
          width: 300.w,
          height: 200.h,
        ),
       SizedBox(height: 20.h,),
        Text(
          textAlign: TextAlign.center,
          "The right relationship is everything.",
          style: AppTextStyle.interBold
              .copyWith(color: AppColors.blue1, fontSize: 24.w),
        ),
         SizedBox(height: 10.h,),
        Text(
          textAlign: TextAlign.center,
          "Your Trusted Partner in Financial Success",
          style: AppTextStyle.interLight.copyWith(
            color: AppColors.blue1,
            fontSize: 16.w,
            fontWeight: FontWeight.w400,
          ),
        ),
    SizedBox(height: 80.h,),
      ],
    );
  }
}
