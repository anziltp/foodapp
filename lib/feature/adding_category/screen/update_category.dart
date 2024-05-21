import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/constans/snack_bar_page.dart';
import 'package:foodapp/models/category_model.dart';

import '../../../main.dart';
import '../controller/category_controller.dart';

class UpdateCategory extends ConsumerStatefulWidget {
  const UpdateCategory({super.key, required this.model});

  final CategoryModel model;

  @override
  ConsumerState<UpdateCategory> createState() => _UpdateCategoryState();
}

class _UpdateCategoryState extends ConsumerState<UpdateCategory> {

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
    uploadTask = FirebaseStorage.instance
        .ref('Categories/${DateTime.now().toString()}-$name')
        .putData(fileBytes, SettableMetadata(contentType: 'image/jpeg'));
    final snapshot = await uploadTask?.whenComplete(() {});
    coverImage = (await snapshot?.ref.getDownloadURL())!;

    // ignore: use_build_context_synchronously
    // showUploadMessage(context, '$name Uploaded Successfully...');
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    // ScaffoldMessenger.of(context).clearSnackBars();
    setState(() {});
  }

  categoryUpdate() {
    CategoryModel update = CategoryModel(
        category: category.text,
        image: coverImage.toString(),
        id:widget.model.id,
        search: [],);
    ref.read(categoryControllerProvider).categoryUpdate(update);
    showSnackBar(context, "Updating.....");
  }

  @override
  void initState() {
    category.text = widget.model.category;
    coverImage = widget.model.image.toString();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                categoryUpdate();
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
                      "Update",
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
    );
  }
}
