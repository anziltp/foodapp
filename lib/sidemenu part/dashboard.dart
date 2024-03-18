import 'package:flutter/material.dart';

import '../main.dart';

class Dashbored extends StatefulWidget {
  const Dashbored({super.key});

  @override
  State<Dashbored> createState() => _DashboredState();
}

class _DashboredState extends State<Dashbored> {
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
              color: Colors.yellow,
              child: Text("dashbored"),
            ),
          )
        ],
      ),
    );
  }
}
