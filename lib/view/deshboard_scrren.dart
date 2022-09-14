import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:themeproj/controller/get_data_controller.dart';
import 'package:themeproj/utils/app_assets.dart';
import 'package:themeproj/utils/app_colors.dart';
import 'package:themeproj/utils/app_navigation.dart';
import 'package:themeproj/utils/app_routes.dart';
import 'package:themeproj/utils/app_strings.dart';
import 'package:themeproj/view/home_screen.dart';
import 'package:themeproj/view/setting_screen.dart';
import 'package:themeproj/widget/custome_appbar.dart';

class DeshboardPage extends StatefulWidget {
  const DeshboardPage({Key? key}) : super(key: key);

  @override
  _DeshboardPageState createState() => _DeshboardPageState();
}

class _DeshboardPageState extends State<DeshboardPage> {
  late PageController _pagecontroller;
  var _currentIndex = 0;

  @override
  void initState() {
    _pagecontroller = PageController(initialPage: 0);

    super.initState();
  }

  String? title;
  @override
  Widget build(BuildContext context) {
    switch (_currentIndex) {
      case 0:
        title = AppStrings.home.toUpperCase();
        break;
      case 1:
        title = AppStrings.settings.toLowerCase();
        break;

      default:
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: CustomeAppbar(
        title: title,
        isleading: false,
      ),
      bottomNavigationBar: _buildBottomBar(),
      extendBody: true,
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: _pagecontroller,
        onPageChanged: (val) {
          setState(() {
            _currentIndex = val;
          });
        },
        children: const [
          HomePage(),
          SettingPage(),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      decoration: BoxDecoration(
        border: const Border(top: BorderSide(color: AppColors.whiteColor)),
        color: Theme.of(context).backgroundColor,
      ),
      child: BottomNavigationBar(
        elevation: 0,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _pagecontroller.jumpToPage(index);
        },
        backgroundColor: Colors.transparent,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.whiteColor,
        selectedFontSize: 16.0,
        unselectedLabelStyle:
            TextStyle(fontSize: 9.sp, color: AppColors.whiteColor),
        selectedLabelStyle: TextStyle(fontSize: 9.sp, color: AppColors.primary),
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Image.asset(
                  AppAssets.homeicon,
                  height: 20,
                  width: 20,
                  color: _currentIndex == 0 ? AppColors.primary : null,
                ),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Image.asset(
                  AppAssets.settingicon,
                  height: 20,
                  width: 20,
                  color: _currentIndex == 1 ? AppColors.primary : null,
                ),
              ),
              label: AppStrings.settings)
        ],
      ),
    );
  }
}
