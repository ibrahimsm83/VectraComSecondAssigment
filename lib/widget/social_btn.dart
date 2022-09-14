import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:themeproj/utils/app_colors.dart';

// ignore: must_be_immutable
class SocialButtons extends StatelessWidget {
  Color? bgcolor;
  String? text;
  String? assetName;
  Function()? onTap;
  SocialButtons(
      {Key? key,
        this.bgcolor = AppColors.primary,
        this.text = "",
        this.assetName,
        this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: bgcolor, borderRadius: BorderRadius.circular(30.0)),
        margin: EdgeInsets.symmetric(horizontal: 14.w),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Image(
                        image: AssetImage(assetName!),
                        fit: BoxFit.contain,
                        color: AppColors.whiteColor,
                      ),
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 0),
              Flexible(
                flex: 3,
                child: Text(
                  text!.toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteColor,

                      fontSize: 12.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
