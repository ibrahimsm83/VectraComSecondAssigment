import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:themeproj/utils/app_colors.dart';
import 'package:themeproj/utils/app_navigation.dart';
import 'package:themeproj/utils/app_routes.dart';
import 'package:themeproj/utils/app_strings.dart';
import 'package:themeproj/widget/custome_snackbar.dart';

class CustomDialog extends StatefulWidget {
  String? navigateto;
  CustomDialog({
    this.navigateto,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _scaleAnimation;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _scaleAnimation =
        CurvedAnimation(parent: _animationController!, curve: Curves.easeIn);
    _animationController!.addListener(() {
      setState(() {});
    });
    _animationController!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: _scaleAnimation!,
        child: Dialog(
          elevation: 0,
          backgroundColor: AppColors.lightblue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(child: _buildDialogContent(context)),
        ));
  }

  bool terms = false;
  bool privacy = false;

  Widget _buildDialogContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: sizeWidth(context),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            color: AppColors.primary,
          ),
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
            child: Text(AppStrings.agreement,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.sp, color: AppColors.whiteColor)),
          ),
        ),
        const SizedBox(height: 10.0),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            AppStrings.ihavereadandagreedwith,
            style: TextStyle(fontSize: 15, color: AppColors.whiteColor),
          ),
        ),
        const SizedBox(height: 10.0),
        termfieldRow(),
        const SizedBox(height: 30.0),
        Row(
          children: [
            Flexible(
              child: InkWell(
                onTap: () {
                  //reject
                  _animationController!.reverse();
                  Navigator.pop(context);
                  //kdsfjkasf
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                    ),
                    color: AppColors.lightblack,
                  ),
                  child: const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          AppStrings.reject,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
              ),
            ),
            Flexible(
              child: InkWell(
                onTap: () {
                  //Accept
                  if (terms && privacy) {
                    AppNavigation.navigateTo(
                        context, widget.navigateto ?? '/login');
                  } else {
                    CustomSnacksBar.showSnackBar(
                        context, "Please check terms and Privacy");
                  }
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                    ),
                    color: AppColors.primary,
                  ),
                  child: const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(AppStrings.accept,
                            style: TextStyle(color: Colors.white)),
                      )),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget termfieldRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    terms = !terms;
                  });
                },
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: terms ? AppColors.whiteColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: terms ? AppColors.primary : Colors.grey,
                          width: 2)),
                  child: Center(
                    child: terms
                        ? const Icon(
                      Icons.check,
                      color: AppColors.primary,
                      size: 18,
                    )
                        : const Text(""),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              //2nd box
              GestureDetector(
                onTap: () {
                  setState(() {
                    privacy = !privacy;
                  });
                },
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color:
                      privacy ? AppColors.whiteColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: privacy ? AppColors.primary : Colors.grey,
                          width: 2)),
                  child: Center(
                    child: privacy
                        ? const Icon(
                      Icons.check,
                      color: AppColors.primary,
                      size: 18,
                    )
                        : const Text(""),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  // AppNavigation.navigateTo(
                  //     context, Routes.termPrivacyPolicyPageRoute,
                  //     arguments: "TERMS & CONDITIONS");
                },
                child: const Text(
                  AppStrings.termsConditions,
                  style: TextStyle(fontSize: 15, color: AppColors.whiteColor),
                ),
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  // AppNavigation.navigateTo(
                  //     context, Routes.termPrivacyPolicyPageRoute,
                  //     arguments: "PRIVACY POLICY");
                },
                child: const Text(
                  AppStrings.privacypolicy,
                  style: TextStyle(fontSize: 15, color: AppColors.whiteColor),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
