import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/constans/snack_bar_page.dart';
import 'package:foodapp/feature/adding_category/controller/category_controller.dart';
import 'package:foodapp/feature/adding_category/screen/update_category.dart';

import '../../../constans/color_const.dart';
import '../../../main.dart';
import '../../toppings_adding/screen/toppings_page.dart';


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
        .showSnackBar(const SnackBar(content: Text("Loading......")));
    uploadFileToFireBase(name, fileBytes);
    setState(() {});
  }
  Future uploadFileToFireBase(String name, fileBytes) async {
    print("fggghh");
    print(fileBytes);
    uploadTask = FirebaseStorage.instance
        .ref('Categories/${DateTime.now().toString()}-$name')
        .putData(fileBytes, SettableMetadata(contentType: 'image/jpeg'));
    final snapshot = await uploadTask?.whenComplete(() {});
    coverImage = (await snapshot?.ref.getDownloadURL())!;
    print("not");
print(BoxFit.cover);
    // ignore: use_build_context_synchronously
    // showUploadMessage(context, '$name Uploaded Successfully...');
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    // ScaffoldMessenger.of(context).clearSnackBars();
    setState(() {});
  }


  addCategory() {
    ref.read(categoryControllerProvider).category(category: category.text, image: coverImage.toString(),id: "", search: []);
    showSnackBar(context, "Uploading...");
    coverImage = "";
    category.clear();

  }
  deleteCategory(String id){
    ref.read(categoryControllerProvider).deleteCategories(id);
    showSnackBar(context, "Deleting.....");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
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
              child: value==true?Image.network(coverImage.toString(),fit: BoxFit.cover,scale: 2,):const Icon(Icons.image),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  value=true;
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
              return SizedBox(
                height: h*1.3,
                width: w*1.3,
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,crossAxisSpacing: w*0.03),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: h*0.2,
                        width: w*0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w*0.01),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.3, 0.7],
                              colors: [Color(0xffF9881F), Color(0xffFF774C)]),
                          border: Border.all()
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(data[index].category,style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: w*0.02,
                                    color: Colors.white
                                ),),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        deleteCategory(data[index].id);
                                      },
                                      child: Container(
                                        height: w*0.025,
                                        width: w*0.025,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(w*0.03),
                                            color: Colors.white
                                        ),
                                        child: const Icon(Icons.delete_outlined,color: Colors.red,),
                                      ),
                                    ),
                                    SizedBox(width: w*0.01,),
                                    GestureDetector(
                                      onTap:() {
                                        Navigator.push(context, CupertinoPageRoute(builder: (context) =>UpdateCategory(model: data[index],),));
                                      },
                                      child: Container(
                                        height: w*0.025,
                                        width: w*0.025,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(w*0.03),
                                            color: Colors.white
                                        ),
                                        child: const Icon(Icons.edit,color: Colors.red,),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: h*0.13,
                                  width: w*0.06,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(w*0.02),
                                  ),
                                  child: Image.network(data[index].image),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ToppingsPage(category: data[index],),));
                                  },
                                  child: Container(
                                    height: h * 0.05,
                                    width: w * 0.07,
                                    decoration: BoxDecoration(
                                          color: ColorConst.white,
                                        borderRadius: BorderRadius.circular(w * 0.02)),
                                    child: Center(
                                        child: Text(
                                          "add Toppings",
                                          style: TextStyle(
                                              fontSize: w * 0.008,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },),
              );
            }, error: (error, stackTrace) {
              return Text(error.toString());
            },

              loading: () {
              return const CircularProgressIndicator();
            },)

          ],
        ),
      ),
    );
  }
}
