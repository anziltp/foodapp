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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Column(

              children: [
                Text("Order from your favourite",style: TextStyle(fontWeight: FontWeight.w600,fontSize: w*0.02),),
                Text("stores or vendors",style: TextStyle(fontWeight: FontWeight.w600,fontSize: w*0.02),),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(ImageConst.firstpageimage,width: w*0.2,),
SizedBox(height: w*0.03,),
SvgPicture.asset(ImageConst.threedots)
            ],
          ),
          Container(
            width: w*0.2,
            height: w*0.03,
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(w*0.04),
              gradient: LinearGradient(
                  colors:[ ColorConst.seondarycolor,
                    ColorConst.primerycolor]),
            ),
            child: Center(child: Text("Create an account",style: TextStyle(
                color: ColorConst.white
            ),)),

          ),
          Text("login",style: TextStyle(color: ColorConst.primerycolor),)
        ],
      ),
    );
  }
}
