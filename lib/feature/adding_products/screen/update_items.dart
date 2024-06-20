import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/feature/adding_products/controller/item_controller.dart';
import 'package:foodapp/models/items_model.dart';

import '../../../constans/color_const.dart';
import '../../../constans/snack_bar_page.dart';
import '../../../main.dart';
import '../../../models/category_model.dart';

class UpdateItems extends ConsumerStatefulWidget {
  final ItemModel items;
  const UpdateItems({super.key, required this.items});

  @override
  ConsumerState<UpdateItems> createState() => _UpdateItemsState();
}

class _UpdateItemsState extends ConsumerState<UpdateItems> {
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
        .showSnackBar(const SnackBar(content: Text("Uploading...")));
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

 itemsUpdate() {
    ItemModel update = ItemModel(
        ItemName: nameController.text,
        ItemDescription: descriptionController.text,
        ItemImage:  coverImage.toString(),
        ItemId: widget.items.ItemId,
        Fav: [],
        categoryId: widget.items.categoryId,
        CategoryName: categoryController.text,
        ItemPrice: double.tryParse(rateController.text)!,
      search: [],

       );
    ref.read(itemsControllerprovider.notifier).itemsUpdate(update);
    Navigator.pop(context);
    showSnackBar(context, "Updating.....");
  }
  @override
  void initState() {
    nameController.text=widget.items.ItemName;
    categoryController.text=widget.items.CategoryName;
    rateController.text=widget.items.ItemPrice.toString();
    descriptionController.text=widget.items.ItemDescription;
    coverImage = widget.items.ItemImage.toString();

    // TODO: implement initState
    super.initState();
  }
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        SizedBox(
        height: w * 0.03,
      ),
      Center(
        child: Container(
          height: w * 0.10,
          width: w * 0.10,
          decoration: BoxDecoration(
              color: Colors.grey,
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
              gradient:  LinearGradient(

                  colors: [ColorConst.Grey,ColorConst.Grey2]),
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
          SizedBox(
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
          SizedBox(width: w * 0.01,),
          SizedBox(
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
        ],
      ),
      SizedBox(height: w*0.01,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: w * 0.4,
            child: TextFormField(
                controller: rateController,
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.number,
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
          SizedBox(width: w * 0.01,),
          SizedBox(
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
              itemsUpdate();
            },
            child: Container(
              height: w * 0.04,
              width: w * 0.2,
              decoration: BoxDecoration(
                  gradient:  LinearGradient(

                      colors: [ColorConst.Grey,ColorConst.Grey2]),
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
                    "Update",
                    style: TextStyle(fontSize: w * 0.015, color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
   ] )

    );
  }
}
