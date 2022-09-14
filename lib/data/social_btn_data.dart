import 'package:flutter/material.dart';
import 'package:themeproj/utils/app_assets.dart';
import 'package:themeproj/utils/app_colors.dart';
import 'package:themeproj/utils/app_strings.dart';


class socialbtnmodel {
  String? text;
  String? iconPath;
  Color? bgcolor;
  socialbtnmodel(this.text, this.iconPath, this.bgcolor);
}

List<socialbtnmodel> socilabtnList = [
  socialbtnmodel(
      AppStrings.loginwithemail, AppAssets.emailwhiteicon, AppColors.primary),
  socialbtnmodel(
      AppStrings.loginwithFacebook, AppAssets.facebookicon, AppColors.facebookbtnColor),
  socialbtnmodel(
      AppStrings.loginwithGoogle, AppAssets.googlewicon, AppColors.googlebtnColor),
  socialbtnmodel(
      AppStrings.loginwithApple, AppAssets.appleicon, AppColors.blackColor),
];
