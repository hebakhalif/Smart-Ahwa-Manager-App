import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager_app/core/routing/routers.dart';
import 'package:smart_ahwa_manager_app/screens/home_screen.dart';
import 'package:smart_ahwa_manager_app/screens/pending_orders_screen.dart';
import 'package:smart_ahwa_manager_app/screens/report_screen.dart';
import 'package:smart_ahwa_manager_app/screens/splash_screen.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
     
        
      case Routes.pendingOrdersScreen:
        return MaterialPageRoute(
          builder: (_) => PendingOrdersScreen(orders: []),
        );
      case Routes.reportScreen:
        return MaterialPageRoute(builder: (_) => ReportScreen( orders: [],));
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(body: Center(child: Text('Page not found!'))),
        );
    }
  }
}
