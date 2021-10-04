import 'package:b2connect_id_scanner/providers/scanner_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import './services/navigation_service.dart';
import './utils/routes.dart';
import './utils/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
        builder: () => MultiProvider(
              providers: [
                ChangeNotifierProvider.value(
                  value: ScannerProvider(),
                ),
              ],
              child: MaterialApp(
                title: 'B2Connect',
                color: Theme.of(context).backgroundColor,
                debugShowCheckedModeBanner: false,
                navigatorKey: locator<NavigationService>().navigatorKey,
                theme: ThemeData(
                  backgroundColor: Color.fromRGBO(31, 106, 247, 1),
                  accentColor: Color.fromRGBO(31, 106, 247, 1),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  fontFamily: 'Roboto',
                ),
                onGenerateRoute: onGenerateRoute,
                initialRoute: SplashScreenRoute,
              ),
            ));
  }
}
