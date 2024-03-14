import 'package:flutter/material.dart';

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
        height: w * 0.13,
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

              label: Padding(
                padding:  EdgeInsets.all(w*0.04),
                child: Text("enter email",
                  style: TextStyle(
                      color: ColorConst.black,
                      fontSize: w * 0.02),),
              ),
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
        height: w * 0.13,
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

              label: Padding(
                padding:  EdgeInsets.all(w*0.04),
                child: Text("enter password",
                  style: TextStyle(
                      color: ColorConst.black,
                      fontSize: w * 0.02),),
              ),
              focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
              enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
            )),
            ),
            Padding(
              padding:  EdgeInsets.only(left: w*0.27,bottom: w*0.02),
              child: Row(
                children: [
                  Text("Confirm Password",style: TextStyle(fontWeight: FontWeight.w700),),
                ],
              ),
            ),
            Container(
        width: w * 0.5,
        height: w * 0.13,
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

              label: Padding(
                padding:  EdgeInsets.all(w*0.04),
                child: Text("Confirm Password",
                  style: TextStyle(
                      color: ColorConst.black,
                      fontSize: w * 0.02),),
              ),
              focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
              enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
            )),
            ),
          ],
        )
          ],
        ),
      ),
    );
  }
}
