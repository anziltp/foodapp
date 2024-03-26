import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



import '../constans/color_const.dart';
import '../main.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}
TextEditingController name = TextEditingController();
TextEditingController subtitle = TextEditingController();
class _AddItemsState extends State<AddItems> {
  bool a = false;
  bool b = false;
  var file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Container(
               width: w * 0.9,
               height: w * 0.5,
               color: Colors.black,
               padding: EdgeInsets.all(w * 0.03),
               margin: EdgeInsets.all(w * 0.03),
               child:Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       file == null?
                       Container(
                           height: h * 0.3,
                           width: w * 0.2,
                           decoration: BoxDecoration(
                               borderRadius:
                               BorderRadius.circular(w * 0.03),
                               color: ColorConst.primerycolor),
                           child: Center(
                               child: Text(
                                 "Up-lode image",
                                 style: TextStyle(
                                     fontSize: w * 0.03,
                                     fontWeight: FontWeight.w700,
                                     color: ColorConst.white),
                               ))):Container(
                           height: h * 0.3,
                           width: w * 0.2,
                           decoration: BoxDecoration(
                               borderRadius:
                               BorderRadius.circular(w * 0.03),
                               color: ColorConst.primerycolor),
                           child:Image(image: FileImage(
                             file,
                           ),
                             fit: BoxFit.fill,)),
                       SizedBox(width: w*0.03,),
                       InkWell(
                         onTap: () {

                         },
                         child: Container(
                           height: h * 0.05,
                           width: w * 0.05,
                           decoration: BoxDecoration(
                               color: ColorConst.white,
                               borderRadius:
                               BorderRadius.circular(w * 0.04),
                               border: Border.all(
                                 color: ColorConst.primerycolor,
                               )),
                           child: Icon(Icons.photo,color: ColorConst.primerycolor,)
                         ),
                       ),
                     ],

                   ),
                   SizedBox(height: h*0.05,),
                   Padding(
                     padding:  EdgeInsets.only(left: w*0.08,right: w*0.08),
                     child: Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text("Item Name",style: TextStyle(fontWeight: FontWeight.w700,color: ColorConst.white),),
                           ],
                         ),
                         SizedBox(height: h*0.01,),
                         TextFormField(

                             controller: name,
                             autovalidateMode:
                             AutovalidateMode.onUserInteraction,
                             keyboardType: TextInputType.name,
                             textInputAction: TextInputAction.newline,
                             decoration: InputDecoration(
                               filled: true,
                               fillColor: ColorConst.white,
                               border: InputBorder.none,


                               focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.01), borderSide: BorderSide(
                                   color: ColorConst.white
                               )),
                               enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.01), borderSide: BorderSide(
                                   color: ColorConst.white
                               )),
                             )),
                       ],
                     ),
                   ),


                   SizedBox(height: h*0.02,),
                   Padding(
                     padding:  EdgeInsets.only(left: w*0.08,right: w*0.08),
                     child: Column(

                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text(" Name",style: TextStyle(fontWeight: FontWeight.w700,color: ColorConst.white),),
                           ],
                         ),
                         SizedBox(height: h*0.01,),
                         TextFormField(
                             controller: subtitle,
                             autovalidateMode:
                             AutovalidateMode.onUserInteraction,
                             keyboardType: TextInputType.emailAddress,
                             textInputAction: TextInputAction.newline,
                             decoration: InputDecoration(
                               filled: true,
                               fillColor: ColorConst.white,
                               border: InputBorder.none,


                               focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.01), borderSide: BorderSide(
                                   color: ColorConst.white
                               )),
                               enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.01), borderSide: BorderSide(
                                   color: ColorConst.white
                               )),
                             )),
                       ],
                     ),
                   ),

                   Padding(
                     padding:  EdgeInsets.all(w*0.05),
                     child: Center(
                       child: Container(
                         width: w * 0.1,
                         height: w * 0.025,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(w * 0.04),
                           gradient: const LinearGradient(
                               begin: Alignment.topLeft,
                               end: Alignment.bottomRight,
                               stops: [0.3, 0.7],
                               colors: [Color(0xffF9881F), Color(0xffFF774C)]),
                         ),
                         child: const Center(
                             child: Text(
                               ""
                                   "Add New items",
                               style: TextStyle(
                                   color: ColorConst.white,
                                   fontWeight: FontWeight.w700),
                             )),
                       ),
                     ),
                   ),
                 ],
               )
           )


          ],
        ),
      ),
    );
    }
  }
