import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../constans/color_const.dart';
import '../constans/image_const.dart';
import '../main.dart';

class Otp_Page extends StatefulWidget {
  const Otp_Page({super.key});

  @override
  State<Otp_Page> createState() => _Otp_PageState();
}

class _Otp_PageState extends State<Otp_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset(ImageConst.splashscreen,width: w*0.03,)),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: w*0.03),
            child: Text("Cancel",style: TextStyle(fontWeight: FontWeight.w600,color: ColorConst.primerycolor),),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:  EdgeInsets.all(w*0.05),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Reset Password",style: TextStyle(fontWeight: FontWeight.w700,fontSize: w*0.015),),
                    SizedBox(height: h*0.02,),
                    Text("A reset code has been sent to your email")
                  ],
                ),
              ),
            ),
            SizedBox(height: h*0.05,),
            Column(
              children: [
                Text("Enter Code"),

            Padding(
              padding:  EdgeInsets.only(left: w*0.03,top: h*0.02),
              child: Container(
                height: w*0.05,
                child: FractionallySizedBox(
                  child: Pinput(
                    
                    closeKeyboardWhenCompleted: true,
                    length: 4,
                    disabledPinTheme: PinTheme(
                        constraints: BoxConstraints(
                            maxHeight: w*0.2,
                            maxWidth: w*0.1
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(w*0.04)
                        )
                    ),
                  ),
                ),
              ),
            ),
                ]),
            SizedBox(height: w*0.04,),
            Container(
              width: w*0.25,
              height: w*0.03,
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(w*0.04),
                gradient: LinearGradient(
                    colors:[ ColorConst.seondarycolor,
                      ColorConst.primerycolor]),
              ),
              child: Center(child: Text("Reset Password",style: TextStyle(
                  color: ColorConst.white
              ),)),

            ),
          ],
        ),
      ),
    );
  }
}
