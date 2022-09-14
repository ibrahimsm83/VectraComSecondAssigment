import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:themeproj/utils/app_assets.dart';
import 'package:themeproj/utils/app_colors.dart';
import 'package:themeproj/widget/appbar_clipper.dart';

// ignore: must_be_immutable
class CustomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  bool isleading;
  Widget? action;
  CustomeAppbar({Key? key, this.title, this.isleading = true, this.action})
      : preferredSize = const Size.fromHeight(kToolbarHeight * 1.7),
        super(key: key);
  @override
  final Size preferredSize; //default is 56.0
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize:
      preferredSize, //const Size.fromHeight(kToolbarHeight * 1.7),
      child: ClipPath(
        clipper: AppBarClipper(),
        child: Container(
          constraints: const BoxConstraints.expand(),
          //padding: EdgeInsets.only(bottom: 20),
          alignment: Alignment.center,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
                left: 10.0,
                right: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: isleading,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        AppAssets.arrowbackicon,
                        height: 15,
                        width: 15,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(
                    title!.toUpperCase(),
                    style:
                    TextStyle(color: AppColors.whiteColor, fontSize: 12.sp),
                  ),
                  action??SizedBox(),
                ],
              ),
            ),
          ),
          decoration: const BoxDecoration(
            color:
            AppColors.primary,
          ),
        ),
      ),
    );
  }
}
