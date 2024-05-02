



import 'package:bank_app/utils/size/screen_utils.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/style/app_text_style.dart';

class BoardingPageTwo extends StatelessWidget {
  const BoardingPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.img2,
          width: 280.w,
          height: 230.h,
        ),
      SizedBox(height: 10.h,),
        Text(
          textAlign: TextAlign.center,
          "Your Financial Partner for Life: Citibank",
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
    SizedBox(height: 100.h,),
      ],
    );
  }
}
