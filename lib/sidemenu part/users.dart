import 'package:flutter/material.dart';

import '../main.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}
class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: h*0.05,
              width: w*0.05,
              color: Colors.purple,
              child: Text("users"),
            ),
          )
        ],
      ),
    );
  }
}
