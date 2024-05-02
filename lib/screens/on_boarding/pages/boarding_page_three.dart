




import 'package:bank_app/utils/size/screen_utils.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/style/app_text_style.dart';

class BoardingPageThree extends StatelessWidget {
  const BoardingPageThree({super.key});

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
        SizedBox(height: 20.h,),
        Text(
          textAlign: TextAlign.center,
          "Your Comprehensive Resource for Financial Success",
          style: AppTextStyle.interBold
              .copyWith(color: AppColors.blue1, fontSize: 22.w),
        ),
        SizedBox(height: 10.h,),
        Text(
          textAlign: TextAlign.center,
          "Choosing the Right Bank for Your Financial Goals",
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
