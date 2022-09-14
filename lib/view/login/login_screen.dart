import 'dart:io';

import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:themeproj/utils/app_assets.dart';
import 'package:themeproj/utils/app_colors.dart';
import 'package:themeproj/utils/app_navigation.dart';
import 'package:themeproj/utils/app_routes.dart';
import 'package:themeproj/utils/app_strings.dart';
import 'package:themeproj/utils/extension.dart';
import 'package:themeproj/widget/custome_appbar.dart';
import 'package:themeproj/widget/custome_button.dart';
import 'package:themeproj/widget/custome_textformfield.dart';
import 'package:themeproj/widget/rich_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.secondry,
        appBar: CustomeAppbar(title: AppStrings.login),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20.0),
                SizedBox(
                  height: Platform.isIOS
                      ? (MediaQuery.of(context).size.height * 0.15 -
                          MediaQuery.of(context).size.height * 0.13 * 0.3)
                      : 15.h,
                ),
                //const AppLogoIcon(),
                SizedBox(height: sizeHeight(context) * 0.06),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: CustomeTextField(
                    labelText: "Email Address",
                    controller: _emailController,
                    prefixIcon:
                        Image.asset(
                    AppAssets.emailredicon,
                    width: 1,
                    height: 1,
                  ),
                    hinttext: AppStrings.hintEmailaddress,
                    validator: (String? v) {
                      if (v!.isValidEmail) {
                        return null;
                      } else {
                        return AppStrings.emailValidator;
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: CustomeTextField(
                    labelText: "Password",
                    controller: _passController,
                    hinttext: "*****************",
                    obscureText: true,
                    validator: (String? v) {
                      if (v!.isValidPassword) {
                        return null;
                      } else {
                        return AppStrings.passwordvalidator;
                      }
                    },
                  ),
                ),
                SizedBox(height: 4.h),
                InkWell(
                  onTap: () {},
                      // AppNavigation.navigateTo(
                      // context, Routes.forgotPasswordPageRoute),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.forgotPassword,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.0),
                  child: CustomeButton(
                    text: AppStrings.login.toUpperCase(),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _emailController.clear();
                        _passController.clear();
                        // CustomSnacksBar.showSnackBar(context, "Process..");
                        AppNavigation.navigateReplacementNamed(
                            context, Routes.deshboardPageRoute);
                      }
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  alignment: Alignment.center,
                  child: RichTextWidget(
                    text1: AppStrings.donthaveanaccount,
                    text2: AppStrings.signuptoday,
                    onTapText2: () {
                     // AppNavigation.navigateTo(context, Routes.signUpviewRoute);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
  
      );
}
