import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../constans/color_const.dart';
import '../constans/image_const.dart';
import '../main.dart';

class Create_page extends StatefulWidget {
  const Create_page({super.key});

  @override
  State<Create_page> createState() => _Create_pageState();
}

class _Create_pageState extends State<Create_page> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Column(
              children: [
                Center(child: Text("Create an account",style: TextStyle(fontWeight: FontWeight.w700,fontSize: w*0.02),)),

            SizedBox(height: w*0.02,),
            Text("Welcome friend, enter your details so lets get\n started in ordering food.")
            ]),
        SizedBox(height: w*0.03,),
        Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: w*0.27,bottom: w*0.02),
              child: Row(
                children: [
                  Text("Email Address",style: TextStyle(fontWeight: FontWeight.w700),),
                ],
              ),
            ),
            Container(
        width: w * 0.5,
        height: w * 0.04,
        decoration: BoxDecoration(
          // border: Border.all(color: Colorconst.primarycolor),
          // borderRadius:
          color: ColorConst.white,
        ),
        child: TextFormField(
            controller: name,
            keyboardType: TextInputType.name,
            autovalidateMode:
            AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.newline,
            decoration: InputDecoration(

              label: Text("enter email",
                style: TextStyle(
                    color: ColorConst.black,
                    fontSize: w * 0.01),),
              focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
              enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
            )),
            ),
            Padding(
              padding:  EdgeInsets.only(left: w*0.27,bottom: w*0.02),
              child: Row(
                children: [
                  Text("Password",style: TextStyle(fontWeight: FontWeight.w700),),
                ],
              ),
            ),
            Container(
        width: w * 0.5,
        height: w * 0.07,
        decoration: BoxDecoration(
          // border: Border.all(color: Colorconst.primarycolor),
          // borderRadius:
          color: ColorConst.white,
        ),
        child: TextFormField(
            controller: name,
            keyboardType: TextInputType.name,
            autovalidateMode:
            AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.newline,
            decoration: InputDecoration(

              label: Text("enter password",
                style: TextStyle(
                    color: ColorConst.black,
                    fontSize: w * 0.01),),
              focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
              enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
            )),
            ),
            Padding(
              padding:  EdgeInsets.only(left: w*0.27,bottom: w*0.02),
              child: Row(
                children: [
                  Text("Confirm Password",style: TextStyle(fontWeight: FontWeight.w700,color: ColorConst.black),),
                ],
              ),
            ),
            Container(
        width: w * 0.5,
        height: w * 0.07,
        decoration: BoxDecoration(
          // border: Border.all(color: Colorconst.primarycolor),
          // borderRadius:
          color: ColorConst.white,
        ),
        child: TextFormField(
            controller: name,
            keyboardType: TextInputType.name,
            autovalidateMode:
            AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.newline,
            decoration: InputDecoration(

              label: Text("Confirm Password",
                style: TextStyle(
                    color: ColorConst.black,
                    fontSize: w * 0.01),),
              focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
              enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
            )),
            ),
          ],
        ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: w*0.25,
                  height: w*0.03,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(w*0.04),
                   color: ColorConst.white,
                    boxShadow: [
                      BoxShadow(
                        blurStyle: BlurStyle.normal,
                        color: Colors.black12.withOpacity(0.15),
                        offset: Offset(0, 4),
                        spreadRadius: 15,
                        blurRadius: 30,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(ImageConst.googlesvg,width: w*0.02,),
                      Text("Sign-in with Google",style: TextStyle(
                          color: ColorConst.black
                      ),),
                    ],
                  ),

                ),
              ],
            ),
            SizedBox(height: h*0.03,),
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
            SizedBox(height: h*0.04,),
            Text("Login to my account",style: TextStyle(fontWeight: FontWeight.w700,color: ColorConst.primerycolor),)
          ],
        ),
      ),
    );
  }
}
