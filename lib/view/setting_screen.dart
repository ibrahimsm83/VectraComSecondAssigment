import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';




class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  void initState() {

    super.initState();
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          SizedBox(
            height: Platform.isIOS
                ? (MediaQuery.of(context).size.height * 0.15 -
                MediaQuery.of(context).size.height * 0.13 * 0.3)
                : 15.h,
          ),
          const  SizedBox(height: 12.0),
          Switch(
            value: isChecked,
            onChanged: (bool value) {
              setState(() {
                isChecked = value;
                Get.changeThemeMode(isChecked ? ThemeMode.light : ThemeMode.dark);
              });
            },
          ),
          
          Text("Light and Dark Theme",style: TextStyle(color: Theme.of(context).cardColor),),





        ],
      ),

    );
  }




}
