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

class _AddItemsState extends ConsumerState<AddItems> {
  TextEditingController category = TextEditingController();

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
        .ref('Categories/${DateTime.now().toString()}-$name')
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

  addCategory() {
    ref
        .read(categoryControllerProvider)
        .category(category: category.text, image: coverImage.toString());
    coverImage = "";
    category.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
            SizedBox(
              height: h * 0.03,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  selectFileToMessage("food");
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
                    "Add Image",
                    style: TextStyle(
                        fontSize: w * 0.012,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
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
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(w * 0.01)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(w * 0.01)),
                  )),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  addCategory();
                },
                child: Container(
                  height: h * 0.06,
                  width: w * 0.12,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.3, 0.7],
                          colors: [Color(0xffF9881F), Color(0xffFF774C)]),
                      borderRadius: BorderRadius.circular(w * 0.06)),
                  child: Center(
                      child: Text(
                    "Upload",
                    style: TextStyle(
                        fontSize: w * 0.012,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
                ),
              ),
            ),

            SizedBox(height: w*0.03,),

            ref.watch(streamDataProvider).when(data: (data){
              return ListView.separated(
                shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(

                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: h*0.2,
                          width: w*0.3,
                          // color: Colors.grey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(data[index].category,style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: w*0.02,
                                color: Colors.black
                              ),),

                              SizedBox(width: w*0.1,),
                              Container(
                                height: w*0.08,
                                width: w*0.08,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(w*0.02),
                                    color: ColorConst.seondarycolor
                                ),
                                child: Image.network(data[index].image),
                              ),
                              Container(
                                height: w*0.03,
                                width: w*0.03,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(w*0.03),
                                  color: Colors.red
                                ),
                                child: Icon(Icons.delete_outlined,color: ColorConst.white,),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: w*0.02,);
                  },
                  itemCount: data.length);
            }, error: (error, stackTrace) {
              return Text(error.toString());
            },

              loading: () {
              return CircularProgressIndicator();
            },)

          ],
        ),
      ),
    );
  }
}
