import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/first_page.dart';

import 'Splash_Screen.dart';

var w;
var h;


Future<void> main() async {


  runApp( FoodApp());
}
class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    w=MediaQuery.of(context).size.width;
    h=MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:FirstPage() ,
        theme: ThemeData(

        ),
      ),
    );

  }
}
