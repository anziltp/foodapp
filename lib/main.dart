import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:foodapp/home_page.dart';

import 'package:foodapp/login%20part/create_account.dart';
import 'package:foodapp/sidemenu%20part/add_items.dart';
import 'package:foodapp/sidemenu%20part/booking.dart';
import 'package:foodapp/sidemenu%20part/product%20_Adding/add_products.dart';
import 'package:foodapp/sidemenu%20part/product%20_Adding/product_Home.dart';

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
        home: HomePage() ,
        theme: ThemeData(

        ),
      ),
    );

  }
}
