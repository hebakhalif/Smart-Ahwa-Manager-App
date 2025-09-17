import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager_app/core/routing/routers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/coffe-removebg-preview.png",
              width: 250,
              height: 240,
            ),
          ),
          Text(
            "Do you want coffee?",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.homeScreen);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black,
              ),
              width: 80,
              height: 40,
              child: Center(
                child: Text(
                  "start",
                  style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
