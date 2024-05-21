import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/constans/snack_bar_page.dart';
import 'package:foodapp/feature/admin_adding/controller/admin_controller.dart';


import '../constans/color_const.dart';
import '../constans/image_const.dart';
import '../home_page.dart';
import '../main.dart';

class CreatePage extends ConsumerStatefulWidget {
  const CreatePage({super.key});

  @override
  ConsumerState<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends ConsumerState<CreatePage> {
  final formKey=GlobalKey<FormState>();
  final emailValidation=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final passwordValidation=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');


  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Center(child: Image.asset(ImageConst.splashscreen,width: w*0.09,)),
                    SizedBox(height: h*0.03,),
                    Text("Yum Yard",style: TextStyle(fontWeight: FontWeight.w800,color: ColorConst.primerycolor,fontSize: w*0.02),)
                  ],
                ),

                Column(
                  children: [
                    Container(
                      width: w * 0.2,
                     // height: w * 0.03,
                      decoration: const BoxDecoration(
                        // border: Border.all(color: Colorconst.primarycolor),
                        // borderRadius:
                        color: ColorConst.white,
                      ),
                      child: TextFormField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.newline,
                          validator: (value) {
                            if(!emailValidation.hasMatch(value!)){
                              return "enter valid email";

                            }else{
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            label: Text(" enter email",
                              style: TextStyle(
                                  color: ColorConst.black,
                                  fontSize: w * 0.01),),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.1)),
                            //focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
                            enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
                          )),
                    ),
                    SizedBox(height: h*0.05,),
                    Container(
                      width: w * 0.2,
                     // height: w * 0.03,
                      decoration: const BoxDecoration(
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
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.1)),

                            //focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
                            enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
                          )),
                    ),
                    SizedBox(height: w*0.04,),
                        InkWell(
                          onTap: () async{
                            // if(
                            // email.text!=""&&
                            //     password.text!=""&&
                            //     formKey.currentState!.validate()
                            // )
                            // {
                              QuerySnapshot<Map<String,dynamic>> admin = await FirebaseFirestore.instance.collection("Admins").where("email",isEqualTo: email.text).where("password",isEqualTo: password.text).get();
                              if(admin.docs.isNotEmpty){
                                currentRole=admin.docs.first.data()["role"];
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage(),), (route) => false);
                              }
                              else{
                              email.text=="" ? ScaffoldMessenger.of(context).
                              showSnackBar(const SnackBar(content: Text("please enter email"))):
                              password.text=="" ? ScaffoldMessenger.of(context).
                              showSnackBar(const SnackBar(content: Text("please enter password"))):
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(content: Text("user not found")));
                              }
                            // }else{
                            //   email.text=="" ? ScaffoldMessenger.of(context).
                            //   showSnackBar(const SnackBar(content: Text("please enter email"))):
                            //   password.text=="" ? ScaffoldMessenger.of(context).
                            //   showSnackBar(const SnackBar(content: Text("please enter password"))):
                            //   ScaffoldMessenger.of(context)
                            //       .showSnackBar(const SnackBar(content: Text("enter your valid details")));
                            // }

                          },

                          child: Container(
                          width: w*0.1,
                          height: w*0.025,
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(w*0.04),
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.3,0.7],
                                colors:[
                                  Color(0xffF9881F),
                                  Color(0xffFF774C)
                                ]),
                          ),
                          child: const Center(child: Text("login",style: TextStyle(
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
      ),
    );
  }
}
