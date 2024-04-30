import 'package:college_details/common/color_page.dart';
import 'package:college_details/models/college_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';
import '../services/api_service.dart';
import 'home_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  void initState() {
    Future.delayed(Duration(
      seconds: 5,
    )).then((value) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
        (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "COLLEGES",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: width * 0.12,
                  color: colorPage.primaryColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
    ;
  }
}
