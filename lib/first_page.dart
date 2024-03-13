import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodapp/constans/color_const.dart';
import 'package:foodapp/constans/image_const.dart';
import 'package:foodapp/first_page_class.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'main.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  int onpageindex = 0;
  PageController onpagecontroller=PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset(ImageConst.splashscreen,width: w*0.03,)),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: w*0.03),
            child: Text("Skip",style: TextStyle(fontWeight: FontWeight.w600,color: ColorConst.primerycolor),),
          )
        ],
      ),
      body: Column(

        children: [
       SizedBox(
         height: h*0.5,
         child: PageView.builder(
           onPageChanged: (value) {
             onpageindex=value;
             setState(() {

             });
           },
          physics: BouncingScrollPhysics(),
           controller: onpagecontroller,
           padEnds: false,
           itemCount:contents.length ,
           scrollDirection: Axis.horizontal,
           itemBuilder: (context, index) {
           onpageindex=index;
           return Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Text(contents[index].text,
               textAlign: TextAlign.center,
                 style: TextStyle(
                   fontWeight: FontWeight.w700,

                 ),
               ),
               SizedBox(height: h*0.05,),
               onpageindex!=2?SizedBox(
                 height: h*0.3,
                 width: w*1,
                 child: Image(image: AssetImage(contents[index].image),),
               ):Stack(
                 children: [
                   Positioned(
                     bottom: w*0.001,
                       right: w*0.25,
                       child: Container(
                         height: h*0.31,
                         width: w*0.5,
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           border: Border.all(color: Colors.redAccent,
                           width: w*0.004)
                         ),
                       )),
                   SizedBox(
                     height: h*0.3,
                     width: w*1,
                     child: Image(image: AssetImage(contents[index].image),),
                   )
                 ],
               )
             ],
           );
         },),
       ),
SizedBox(height: w*0.03,),
              Padding(
                padding: EdgeInsets.all(w * 0.03),
                child: AnimatedSmoothIndicator(
                  activeIndex: onpageindex,
                  count: 3,
                  effect: SlideEffect(
                      dotWidth: w * 0.01,
                      dotHeight: w * 0.01,
                      activeDotColor: Colors.green),
                ),
              ),

          Container(
            width: w*0.25,
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
