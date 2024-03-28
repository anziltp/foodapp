import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:foodapp/home_page.dart';

import 'package:foodapp/login%20part/create_account.dart';
import 'package:foodapp/feature/adding_category/screen/category_page.dart';
import 'package:foodapp/sidemenu%20part/booking.dart';
import 'package:foodapp/sidemenu%20part/product%20_Adding/add_products.dart';
import 'package:foodapp/sidemenu%20part/product%20_Adding/product_Home.dart';

import 'Splash_Screen.dart';
import 'firebase_options.dart';

var w;
var h;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp( ProviderScope(child: FoodApp()));
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
