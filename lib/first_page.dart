import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodapp/constans/color_const.dart';
import 'package:foodapp/constans/image_const.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'main.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int initialindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset(ImageConst.splashscreen,width: w*0.03,)),
        actions: [
          Text("Skip",style: TextStyle(fontWeight: FontWeight.w600,color: ColorConst.primerycolor),)
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Column(

              children: [
                Text("Order from your favourite",style: TextStyle(fontWeight: FontWeight.w600),),
                Text("stores or vendors",style: TextStyle(fontWeight: FontWeight.w600),),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageConst.firstpageimage,width: w*0.2,),
SvgPicture.asset(ImageConst.threedots)
            ],
          )
        ],
      ),
    );
  }
}
