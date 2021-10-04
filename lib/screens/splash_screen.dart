import 'dart:async';
import 'package:flutter/material.dart';

import '../services/storage_service.dart';
import '../utils/routes.dart';
import '../services/navigation_service.dart';
import '../utils/service_locator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var navigationService = locator<NavigationService>();
  var storageService = locator<StorageService>();

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () async {
      navigationService.navigateTo(ProfileScreenRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
