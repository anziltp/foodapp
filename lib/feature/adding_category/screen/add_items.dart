import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/feature/adding_category/controller/category_controller.dart';

import '../../../constans/color_const.dart';
import '../../../main.dart';

class AddItems extends ConsumerStatefulWidget {
  const AddItems({super.key});

  @override
  ConsumerState<AddItems> createState() => _AddItemsState();
}

TextEditingController category = TextEditingController();

class _AddItemsState extends ConsumerState<AddItems> {


  PlatformFile? pickFile;
  UploadTask? uploadTask;
  String? coverImage;
  bool value = false;


  Future selectFileToMessage(String name) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    pickFile = result.files.first;

    // String? ext = pickFile?.name?.split('.')?.last;
    final fileBytes = result.files.first.bytes;

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Uploading...")));
    uploadFileToFireBase(name, fileBytes);

    setState(() {});
  }

  Future uploadFileToFireBase(String name, fileBytes) async {
    uploadTask = FirebaseStorage.instance
        .ref('Hotel/${DateTime.now().toString()}-$name')
        .putData(fileBytes, SettableMetadata(contentType: 'image/jpeg'));
    final snapshot = await uploadTask?.whenComplete(() {});
    coverImage = (await snapshot?.ref?.getDownloadURL())!;

    // ignore: use_build_context_synchronously
    // showUploadMessage(context, '$name Uploaded Successfully...');
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    // ScaffoldMessenger.of(context).clearSnackBars();
    setState(() {});
  }

  addCategory(){
    ref.read(categoryControllerProvider).category(category.text, "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                selectFileToMessage("food");
              },
              child: Container(
                height: h * 0.3,
                width: w * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w * 0.03),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.3, 0.7],
                      colors: [Color(0xffF9881F), Color(0xffFF774C)]),
                ),
                child: Image.network(coverImage.toString()),
              ),
            ),
            SizedBox(height: h*0.03,),
            SizedBox(
              width: w * 0.4,
              child: TextFormField(
                  controller: category,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(
                      fontSize: w * 0.015, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    filled: true,
                    labelText: "Category",
                    labelStyle: TextStyle(
                        fontSize: w * 0.015, fontWeight: FontWeight.w500),
                    // hintText: "Please enter your name",
                    // hintStyle: TextStyle(
                    //   fontSize: w * 0.015,
                    //   fontWeight: FontWeight.w500,
                    // ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(w * 0.01)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(w * 0.01)),
                  )),
            ),
            SizedBox(height: h*0.02,),
            Center(
              child: GestureDetector(
                onTap: () {
                  addCategory();
                },
                child: Container(
                  height: h * 0.05,
                  width: w * 0.1,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.3, 0.7],
                          colors: [Color(0xffF9881F), Color(0xffFF774C)]),
                      borderRadius: BorderRadius.circular(w * 0.06)),
                  child: Center(
                      child: Text(
                        "Add",
                        style: TextStyle(
                            fontSize: w * 0.012,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
