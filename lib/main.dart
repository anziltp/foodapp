import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:foodapp/home_page.dart';

import 'firebase_options.dart';

var w;
var h;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

// void main(){
//   runApp(FoodApp());
// }


Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized(

  );
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp( const ProviderScope(child: FoodApp()));
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
}}
