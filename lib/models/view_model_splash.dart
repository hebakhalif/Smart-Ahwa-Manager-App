import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager_app/core/routing/app_router.dart';
import 'package:smart_ahwa_manager_app/core/routing/routers.dart';
final AppRouter appRouter = AppRouter();
 
class SplashTimerViewModel {
  void startTimer(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
       Navigator.pushReplacementNamed(context, Routes.splashScreen);
    }
       );
    }
  }
