import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/models/category_model.dart';
import 'package:foodapp/models/items_model.dart';

import 'package:image_picker/image_picker.dart';

import '../../../main.dart';
import '../../../models/user_model.dart';
import '../controller/item_controller.dart';


class AddProducts extends ConsumerStatefulWidget {
 final CategoryModel category;
   AddProducts({super.key,required this.category});

  @override
  ConsumerState<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends ConsumerState<AddProducts> {
  String imgUrl = 'https://cdn.pixabay.com/photo/2017/02/07/02/16/cloud-2044823_960_720.png';

  PlatformFile? pickFile;
  UploadTask? uploadTask;
  String? urlDownlod;
  String? coverImage;
  String? chooseitem;

String categoryId="";

  bool coverPhoto=false;

  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
    uploadTask = FirebaseStorage.instance.ref('banner/${DateTime.now().toString()}-$name')
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
  List imageUrlList =[];
  Future uploadFileToFireBaseMultiple(String name, fileBytes) async {
    uploadTask = FirebaseStorage.instance
        .ref('banner/${DateTime.now().toString()}-$name')
        .putData(fileBytes, SettableMetadata(contentType: 'image/jpeg'));
    final snapshot = await uploadTask?.whenComplete(() {});
    urlDownlod = (await snapshot?.ref?.getDownloadURL())!;

    imageUrlList.add(urlDownlod);

    print("imageUrlList");
    print(imageUrlList);


    setState(() {});
  }

  var imagesList =[];

  Future selectMultipleFiles(String name) async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true,);
    if (result == null) return;

    imagesList = result.files;

    for(var docs in imagesList){
      print(docs.runtimeType);
      final fileBytes = docs.bytes;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Uploading...")));
      uploadFileToFireBaseMultiple(name, fileBytes);

    }
    setState(() {});
  }

addingItemsss(){
    ItemModel itemnew=ItemModel(
        ItemName: nameController.text,
        ItemDescription: descriptionController.text,
        ItemImage: coverImage.toString(),
        ItemPrice: rateController.text,
        ItemId: "",
        Fav: []
    );

    ref.watch(itemsControllerprovider).addingItems(categoryId:widget.category.id, itemAdding: itemnew);

}


  getImageDetails() {
    if (urlDownlod == '') {
      showUploadMessage(context, 'please upload image');
    }if (nameController.text == '') {
      showUploadMessage(context, 'please upload name');
    }if (rateController.text == '') {
      showUploadMessage(context, 'please upload rate');
    }


    Usermodel userModelData = Usermodel(
        name: nameController.text,
        price: rateController.text, favourite: []
        // place: placeController.text,
        // rate: double.tryParse(rateController.text),
        // image: coverImage.toString(),
        // image2: imageUrlList,
        // description: descriptionController.text,
        // category: chooseitem
    );

    // FirebaseFirestore.instance.collection("Hotel").doc(nameController.text).set(userModelData.toMap()

      // "name":nameController.text,
      // "place":placeController.text,
      // "rate":rateController.text,
      // "image": urlDownlod
    // );
  }

  @override
  void didChangeDependencies() {
    categoryController.text=widget.category.category;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: w * 0.03,
            ),
            Center(
              child: Container(
                height: w * 0.10,
                width: w * 0.10,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(w * 0.03),
                    image:coverPhoto == true? DecorationImage(image:   NetworkImage(coverImage.toString()),fit: BoxFit.cover)  :DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZUX7zo1yYFaBeOYIcOfcgwnULvpM7YqzXxA&usqp=CAU"),fit: BoxFit.cover)
                ),
              ),
            ),
            SizedBox(height: w*0.008,),
            InkWell(
              onTap: () {
                selectFileToMessage("salman");
                coverPhoto=true;
                setState(() {
                });
              },
              child: Container(
                height: w * 0.04,
                width: w * 0.09,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3,0.7],
                        colors:[
                          Color(0xffF9881F),
                          Color(0xffFF774C)
                        ]),
                    borderRadius: BorderRadius.circular(w * 0.01)),
                child: Center(
                    child: Text("Cover image",
                        style: TextStyle(fontSize: w * 0.015, color: Colors.white))),
              ),
            ),
            SizedBox(height: w*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: w * 0.4,
                  child: TextFormField(
                      controller: nameController,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(fontSize: w * 0.015, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        filled: true,
                        labelText: "Name",
                        labelStyle:
                        TextStyle(fontSize: w * 0.015, fontWeight: FontWeight.w500),
                        hintText: "Please enter your name",
                        hintStyle: TextStyle(
                          fontSize: w * 0.015,
                          fontWeight: FontWeight.w500,
                        ),
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
                SizedBox(width: w * 0.01,),
                Container(
                  width: w * 0.4,
                  child: TextFormField(
                      controller: categoryController,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                       enabled: false,
                      style: TextStyle(fontSize: w * 0.015, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        filled: true,
                        labelText: "category",
                        labelStyle:
                        TextStyle(fontSize: w * 0.015, fontWeight: FontWeight.w500),
                        hintStyle: TextStyle(
                          fontSize: w * 0.015,
                          fontWeight: FontWeight.w500,
                        ),
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
              ],
            ),
            SizedBox(height: w*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: w * 0.4,
                  child: TextFormField(
                      controller: rateController,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(fontSize: w * 0.015, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        filled: true,
                        labelText: "price",
                        labelStyle:
                        TextStyle(fontSize: w * 0.015, fontWeight: FontWeight.w500),
                        hintText: "Please enter price",
                        hintStyle: TextStyle(
                          fontSize: w * 0.015,
                          fontWeight: FontWeight.w500,
                        ),
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
                SizedBox(width: w * 0.01,),
                Container(
                  width: w * 0.4,
                  child: TextFormField(
                      controller: descriptionController,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(fontSize: w * 0.015, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        filled: true,
                        labelText: "Description",
                        labelStyle:
                        TextStyle(fontSize: w * 0.015, fontWeight: FontWeight.w500),
                        hintText: "description",
                        hintStyle: TextStyle(
                          fontSize: w * 0.015,
                          fontWeight: FontWeight.w500,
                        ),
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
              ],
            ),
            SizedBox(height: w*0.01,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                SizedBox(width: w*0.05,),
                InkWell(
                  onTap: () {
                    addingItemsss();
                    getImageDetails();
                    nameController.clear();
                    // categoryController.clear();
                    rateController.clear();
                    descriptionController.clear();
                    imageUrlList=[];
                    coverImage='';
                    chooseitem="";
                    setState(() {

                    });

                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Successfull")));
                  },
                  child: Container(
                    height: w * 0.04,
                    width: w * 0.2,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.3,0.7],
                            colors:[
                              Color(0xffF9881F),
                              Color(0xffFF774C)
                            ]),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.20),
                            offset: Offset(0, 4),
                            spreadRadius: 2,
                            blurRadius: 4,
                          )
                        ],
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(w * 0.03)),
                    child: Center(
                        child: Text(
                          "Upload",
                          style: TextStyle(fontSize: w * 0.015, color: Colors.white),
                        )),
                  ),
                ),
                // InkWell(
                //   onTap: () {
                //     selectMultipleFiles('name');
                //   },
                //
                //   child: Container(
                //       height: w * 0.04,
                //       width: w * 0.09,
                //       decoration: BoxDecoration(
                //           color: Colors.green,
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.green.withOpacity(0.20),
                //               offset: Offset(0, 4),
                //               spreadRadius: 2,
                //               blurRadius: 4,
                //             )
                //           ],
                //           borderRadius: BorderRadius.circular(w * 0.01)),
                //       child: Center(child: Text("Add Extra Image",style: TextStyle(
                //           color: Colors.white,
                //           fontSize: w*0.01
                //       ),))
                //   ),
                // ),
              ],
            ),

            // Row(
            //   children: List.generate(imageUrlList.length, (index) => Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Container(
            //       // child: Image.network(im),
            //       height: 100,
            //       width: 100,
            //       decoration: BoxDecoration(
            //           color: Colors.tealAccent.shade200,
            //           borderRadius: BorderRadius.circular(15),
            //           image: DecorationImage(image: NetworkImage(imageUrlList[index]),fit: BoxFit.cover)
            //       ),
            //
            //     ),
            //   )),
            // ),
          ]),
        ));
  }
}

showUploadMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  return ;
}
