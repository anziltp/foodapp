import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constans/color_const.dart';
import '../constans/image_const.dart';
import '../main.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
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
                  Center(child: Text("Login to your account",style: TextStyle(fontWeight: FontWeight.w700,fontSize: w*0.02),)),

                  SizedBox(height: w*0.02,),
                  Text("Good to see you again, enter your details\n below to continue ordering.")
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
                  height: w * 0.05,
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
                  height: w * 0.05,
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
                ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(ImageConst.googlesvg,width: w*0.02,),
                      Text("Sign-in with Google",style: TextStyle(
                          color: ColorConst.black
                      ),),
                    ],
                  ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

