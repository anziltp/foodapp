import 'package:flutter/material.dart';
import 'package:foodapp/constans/image_const.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
Center(child: Image.asset(ImageConst.splashscreen,width: w*0.09,))
        ],
      ),
    );
  }
}
