import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:themeproj/utils/app_colors.dart';

// ignore: must_be_immutable
class CustomeButton extends StatelessWidget {
  String? text;
  FontWeight? fontWeight;
  Color? color;
  Function()? onTap;
  CustomeButton(
      {Key? key,
        this.onTap,
        this.text,
        this.fontWeight = FontWeight.normal,
        this.color = AppColors.primary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                text!,
                style:
                TextStyle(color: AppColors.whiteColor, fontWeight: fontWeight,fontSize: 13.sp),
              ),
            )),
      ),
    );
  }
}
