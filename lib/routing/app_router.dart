import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_app/logic/addload_provider.dart';
import 'package:solar_app/logic/home_provider.dart';
import 'package:solar_app/routing/app_routes.dart';
import 'package:solar_app/screens/add_load_screen.dart';
import 'package:solar_app/screens/main_screen.dart';

class AppRouter {
  Route? generateRoue(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.addLoad:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => AddloadProvider(),
            child: AddLoadScreen(),
          ),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => HomeProvider()..getHomePage(),
            child: MainScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
