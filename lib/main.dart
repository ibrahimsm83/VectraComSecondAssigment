import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:themeproj/utils/app_routes.dart';
import 'package:themeproj/utils/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'VectraCom',
        theme: AppTheme().lightTheme,
        darkTheme: AppTheme().darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.preLoginRoute,
        onGenerateRoute: RouteGenerator.getRoute,
      );
    });
  }

  MaterialColor myappColor = const MaterialColor(
    0xFF27B0FF,
    <int, Color>{
      50: Color(0xFF27B0FF), //10%
      100: Color(0xFF27B0FF), //20%
      200: Color(0xFF27B0FF), //30%
      300: Color(0xFF27B0FF), //40%
      400: Color(0xFF27B0FF), //50%
      500: Color(0xFF27B0FF), //60%
      600: Color(0xFF27B0FF), //70%
      700: Color(0xFF27B0FF), //80%
      800: Color(0xFF27B0FF), //90%
      900: Color(0xFF27B0FF), //100%
    },
  );
}
