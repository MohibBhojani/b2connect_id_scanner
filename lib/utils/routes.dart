import 'package:flutter/material.dart';

import '../screens/scan_screen.dart';
import '../screens/profile_screeen.dart';
import '../screens/splash_screen.dart';

const SplashScreenRoute = '/splash-screen';
const ProfileScreenRoute = '/profile-screen';
const ScanScreenRoute = '/scan-screen';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => SplashScreen());

    case ProfileScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => ProfileScreen());

    case ScanScreenRoute:
      return MaterialPageRoute(builder: (BuildContext context) => ScanScreen());

    default:
      return MaterialPageRoute(
          builder: (BuildContext context) => ProfileScreen());
  }
}
