import 'package:flutter/material.dart';
import 'package:foodapp/constans/color_const.dart';

import '../main.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: h*0.05,
              width: w*0.05,
              color: ColorConst.primerycolor,
              child: Text("booking"),
            ),
          )
        ],
      ),
    );
  }
}
