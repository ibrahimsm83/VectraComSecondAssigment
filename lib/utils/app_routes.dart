import 'package:flutter/material.dart';
import 'package:themeproj/view/deshboard_scrren.dart';
import 'package:themeproj/view/login/login_screen.dart';
import 'package:themeproj/view/login/pre_login_screen.dart';


class Routes {
  //static const String splashRoute = "/";
  // static const String preLoginRoute = "/preLogin";
  static const String preLoginRoute = "/";
  static const String loginRoute = "/login";
  static const String signUpviewRoute = "/signUpView";
  static const String deshboardPageRoute = "/deshboardPage";

}

class RouteGenerator {

  static late GlobalKey dashboardKey;

  static Route<dynamic> getRoute(RouteSettings routeSettings) {

    switch (routeSettings.name) {
      case Routes.preLoginRoute:
        return MaterialPageRoute(builder: (_) => const PreLoginview());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case Routes.deshboardPageRoute:
        dashboardKey=GlobalKey();
        return MaterialPageRoute(builder: (_) => DeshboardPage(key: dashboardKey,));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: const Text("No Route Found")),
          body: const Center(child: Text("No Route Found")),
        ));
  }
}
