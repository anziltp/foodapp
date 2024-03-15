import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodapp/home_page.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(child: Image.asset(ImageConst.splashscreen,width: w*0.09,)),
              Column(
                children: [
                  Container(
                    width: w * 0.2,
                    height: w * 0.03,
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

                          label: Text("User Name",
                            style: TextStyle(
                                color: ColorConst.black,
                                fontSize: w * 0.01),),
                          focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
                          enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
                        )),
                  ),
                  SizedBox(height: h*0.05,),
                  Container(
                    width: w * 0.2,
                    height: w * 0.03,
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colorconst.primarycolor),
                      // borderRadius:
                      color: ColorConst.white,
                    ),
                    child: TextFormField(
                        controller: password,
                        keyboardType: TextInputType.text,
                        autovalidateMode:
                        AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(

                          label: Text("password",
                            style: TextStyle(
                                color: ColorConst.black,
                                fontSize: w * 0.01),),
                          focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
                          enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
                        )),
                  ),
                  SizedBox(height: w*0.04,),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>HomePage(),));
                        },
                        child: Container(
                        width: w*0.1,
                        height: w*0.025,
                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(w*0.04),
                          gradient: LinearGradient(
                              colors:[ ColorConst.seondarycolor,
                                ColorConst.primerycolor]),
                        ),
                        child: Center(child: Text("login",style: TextStyle(
                            color: ColorConst.white,fontWeight: FontWeight.w700
                        ),)),

                                            ),
                      ),

                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
