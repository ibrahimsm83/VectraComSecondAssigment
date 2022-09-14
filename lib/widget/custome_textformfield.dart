import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:themeproj/utils/app_assets.dart';
import 'package:themeproj/utils/app_colors.dart';

// ignore: must_be_immutable
class CustomeTextField extends StatefulWidget {
  final String? hinttext;
  final String? labelText;
  final Widget? prefixIcon;
  final int? maxLines;
  final bool underline;
  bool obscureText;
  final Function()? onTap;
  final bool readOnly;
  Color textcolor;
  final String? initialValue;
  TextInputType? keyboardType;
  TextEditingController? controller;
  final String? Function(String?)? validator;
  CustomeTextField(
      {Key? key,
        this.readOnly = false,
        this.initialValue,
        this.maxLines = 1,
        this.prefixIcon,
        this.underline = false,
        this.hinttext,
        this.labelText,
        this.validator,
        this.onTap,
        this.keyboardType = TextInputType.text,
        this.obscureText = false,
        this.textcolor = Colors.white,
        this.controller})
      : super(key: key);

  @override
  State<CustomeTextField> createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  late bool _pwShow;
  @override
  void initState() {
    _pwShow = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 50,
      child: TextFormField(
        keyboardType: widget.keyboardType,
        readOnly: widget.readOnly,
        initialValue: widget.initialValue,
        controller: widget.controller,
        obscureText: _pwShow,
        onTap: widget.onTap,
        validator: widget.validator,
        //cursorColor: AppColors.whiteColor,
        maxLines: widget.maxLines,
        style: TextStyle(color: widget.textcolor, fontSize: 10.sp),
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
          //filled: true,
          //fillColor: AppColors.whiteColor,
          filled: true,
          //isCollapsed: true,
          fillColor: AppColors.lightblue,
          labelText: widget.labelText,
          errorStyle: const TextStyle(color: AppColors.whiteColor),
          labelStyle: const TextStyle(
            color: AppColors.whiteColor,
            fontSize: 20,
          ),
          hintText: widget.hinttext,
          hintStyle: TextStyle(color: AppColors.whiteColor, fontSize: 12.sp),
          errorMaxLines: 3,
          suffixIcon: Visibility(
              visible: widget.obscureText,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _pwShow = !_pwShow;
                  });
                },
                child: _pwShow
                    ? const Icon(
                  Icons.visibility_off,
                  color: AppColors.whiteColor,
                )
                    : const Icon(
                  Icons.visibility,
                  color: Colors.grey,
                ),
              )),
          prefixIcon: widget.obscureText
              ? Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset(
              AppAssets.lockredicon,
              width: 1,
              height: 1,
            ),
          )
              : Padding(
            padding: const EdgeInsets.all(15.0),
            child: widget.prefixIcon,
          ),
          //  border:widget.underline?InputBorder.none:null,
          // focusedBorder: widget.underline?InputBorder.none:null,
          // enabledBorder: widget.underline?InputBorder.none:null,
          // errorBorder:widget.underline? InputBorder.none:null,
          // disabledBorder: widget.underline?InputBorder.none:null,
          contentPadding: EdgeInsets.fromLTRB(14, 14.0, 0, 14.0),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: AppColors.secondry)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: AppColors.primary)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: AppColors.primary)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: AppColors.primary)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: AppColors.secondry)),
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(30),
          //   borderSide: BorderSide(color: AppColors.whiteColor, width: 2.0),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(30),
          //   borderSide: BorderSide(color: AppColors.whiteColor, width: 2.0),
          // ),
          // errorBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(30),
          //   borderSide: const BorderSide(color: Colors.red, width: 2.0),
          // ),
          // focusedErrorBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(30),
          //   borderSide: const BorderSide(color: Colors.red, width: 2.0),
          // ),
        ),
      ),
    );
  }
}
