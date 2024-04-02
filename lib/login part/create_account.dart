import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import '../constans/color_const.dart';
import '../constans/image_const.dart';
import '../home_page.dart';
import '../main.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final formKey=GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
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
                Center(child: Image.asset(ImageConst.splashscreen,width: w*0.09,)),
                Column(
                  children: [
                    Container(
                      width: w * 0.2,
                      height: w * 0.03,
                      decoration: const BoxDecoration(
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

                            focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
                            enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
                          )),
                    ),
                    SizedBox(height: w*0.04,),
                        InkWell(
                          onTap: () {
                            if(
                            name.text!=""&&
                                password.text!=""&&
                                formKey.currentState!.validate()
                            )
                            {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => HomePage(),));
                            }else{
                              name.text=="" ? ScaffoldMessenger.of(context).
                              showSnackBar(SnackBar(content: Text("please enter username"))):
                              password.text=="" ? ScaffoldMessenger.of(context).
                              showSnackBar(SnackBar(content: Text("please enter password"))):
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text("enter your valid details")));
                            }

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
