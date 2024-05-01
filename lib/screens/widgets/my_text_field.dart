
import 'package:bank_app/utils/size/screen_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../utils/colors/app_colors.dart';


class MyTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyBoardType;
  final Widget? suffixIcon;
  final MaskTextInputFormatter? maskTextInputFormatter;
  final bool isObscureText;
  final FocusNode? focusNode;
  final Widget? prefixIcon;

  const MyTextFieldWidget({
    super.key,
    this.hintText = '',
    required this.keyBoardType,
    required this.controller,
    this.suffixIcon = const SizedBox(),
    this.maskTextInputFormatter,
    this.isObscureText = false,
    this.focusNode,
    this.prefixIcon,
  });

  @override
  State<MyTextFieldWidget> createState() => _MyTextFieldWidgetState();
}

class _MyTextFieldWidgetState extends State<MyTextFieldWidget> {
  bool obscure = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.h),
          padding: EdgeInsets.symmetric(vertical: 5.w),
          decoration: BoxDecoration(
            color: AppColors.mainColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            obscureText: obscure,
            focusNode: widget.focusNode,
            inputFormatters: widget.maskTextInputFormatter != null
                ? [widget.maskTextInputFormatter!]
                : null,
            controller: widget.controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.w),
              hintText: widget.hintText,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.isObscureText
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      icon: Icon(obscure
                          ? CupertinoIcons.eye
                          : CupertinoIcons.eye_slash),
                    )
                  : widget.suffixIcon,
              hintStyle:
                  TextStyle(color: Colors.grey.shade500, fontSize: 14.w),
              border: InputBorder.none,
            ),
            style: TextStyle(
              fontSize: 16.w,
              color: Colors.black,
            ),
            keyboardType: widget.keyBoardType,
            // maxLines: ,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
