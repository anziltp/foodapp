import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../constans/color_const.dart';
import '../../constans/image_const.dart';
import '../../home_page.dart';
import '../../main.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}


class _AddProductsState extends State<AddProducts> {
  TextEditingController namecondroller = TextEditingController();
  TextEditingController pricecondroller = TextEditingController();
  final formKey = GlobalKey();

  bool a = false;
  bool b = false;
  var file;
  Future<void> pickimage(ImageSource a) async {
    ImagePicker imagePicker = ImagePicker();
    final imamefile = await imagePicker.pickImage(source: a);
    file = File(imamefile!.path);
    if (mounted) {
      file = File(imamefile.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: w * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Edit the product",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: ColorConst.white),
                    ),
                  ],
                ),
              ),
              Container(
                width: w * 0.9,
                height: w * 0.5,
                color: Colors.grey,
                padding: EdgeInsets.all(w * 0.03),
                margin: EdgeInsets.all(w * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            file == null
                                ? Container(
                                    height: h * 0.3,
                                    width: w * 0.3,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(w * 0.03),
                                        color: ColorConst.white),
                                    child: Center(
                                        child: Text(
                                      "Uplode image",
                                      style: TextStyle(
                                          fontSize: w * 0.03,
                                          fontWeight: FontWeight.w700,
                                          color: ColorConst.primerycolor),
                                    )))
                                : Container(
                                    height: h * 0.3,
                                    width: w * 0.3,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(w * 0.03),
                                        color: ColorConst.white),
                                    child: Image(
                                      image: FileImage(
                                        file,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                            SizedBox(
                              height: h * 0.05,
                            ),
                            InkWell(
                              onTap: () {
                                pickimage(ImageSource.gallery);
                              },
                              child: Container(
                                height: h * 0.07,
                                width: w * 0.07,
                                decoration: BoxDecoration(
                                    color: ColorConst.white,
                                    borderRadius:
                                        BorderRadius.circular(w * 0.04),
                                    border: Border.all(
                                      color: ColorConst.primerycolor,
                                    )),
                                child: Center(
                                    child: Text(
                                  "New image",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: ColorConst.primerycolor),
                                )),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: w * 0.3,
                              height: w * 0.03,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w * 0.04),
                                border:
                                    Border.all(color: ColorConst.primerycolor),
                                color: ColorConst.white,
                              ),
                              child: TextFormField(
                                  controller: name,
                                  keyboardType: TextInputType.name,
                                  // autovalidateMode:
                                  // AutovalidateMode.onUserInteraction,
                                  // textInputAction: TextInputAction.newline,
                                  decoration: InputDecoration(
                                    label: Padding(
                                      padding: EdgeInsets.only(left: w * 0.02),
                                      child: Text(
                                        "Product Name",
                                        style: TextStyle(
                                            color: ColorConst.black,
                                            fontSize: w * 0.01),
                                      ),
                                    ),
                                    // focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
                                    // enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
                                  )),
                            ),
                            SizedBox(
                              height: h * 0.05,
                            ),
                            Container(
                              width: w * 0.2,
                              height: w * 0.03,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: ColorConst.primerycolor),
                                borderRadius: BorderRadius.circular(w * 0.04),
                                color: ColorConst.white,
                              ),
                              child: TextFormField(
                                  controller: password,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9.]'))
                                  ],
                                  decoration: InputDecoration(
                                    label: Padding(
                                      padding: EdgeInsets.only(left: w * 0.03),
                                      child: Text(
                                        "Price",
                                        style: TextStyle(
                                            color: ColorConst.black,
                                            fontSize: w * 0.01),
                                      ),
                                    ),

                                    // focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
                                    // enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(w * 0.04),),
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: h * 0.05,
                    ),
                    Center(
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
                          "Add New Products",
                          style: TextStyle(
                              color: ColorConst.white,
                              fontWeight: FontWeight.w700),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
