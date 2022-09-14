import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:themeproj/utils/app_colors.dart';

// ignore: must_be_immutable
class RichTextWidget extends StatelessWidget {
  String? text1;
  String? text2;
  Function()? onTapText2;
  RichTextWidget({Key? key, this.text1, this.text2, this.onTapText2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: TextStyle(color: Colors.white, fontSize: 13.sp),
        children: <TextSpan>[
          TextSpan(
            text: text2,
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp),
            recognizer: TapGestureRecognizer()..onTap = onTapText2,
          )
        ],
      ),
    );
  }
}
