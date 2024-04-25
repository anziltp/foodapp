import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/models/category_model.dart';
import 'package:foodapp/models/toppings_model.dart';

import '../../../constans/color_const.dart';
import '../../../constans/snack_bar_page.dart';
import '../../../main.dart';
import '../../adding_banner/condroller/banner_controller.dart';
import '../controller/toppings_controller.dart';

class ToppingsPage extends ConsumerStatefulWidget {
  final CategoryModel category;
  const ToppingsPage({super.key,required this.category });

  @override
  ConsumerState<ToppingsPage> createState() => _PoppinsPageState();
}

class _PoppinsPageState extends ConsumerState<ToppingsPage> {
  PlatformFile? pickFile;
  UploadTask? uploadTask;
  String? coverImage;
  bool value = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController category = TextEditingController();

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
        .ref('Banner/${DateTime.now().toString()}-$name')
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
  addPoppins() {
    ref.read(toppingsControllerProvider).
    toppins( category: category.text, name: nameController.text, image: coverImage.toString(),id: "",);
    showSnackBar(context, "Uploading...");
    ToppingsModel toppings=ToppingsModel(
      name: nameController.text,
      category: category.text,
      id: "",
      image: coverImage.toString(),


    );
  }
  @override
  void didChangeDependencies() {
    category.text=widget.category.category;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                    image:value == true? DecorationImage(image:   NetworkImage(coverImage.toString()),fit: BoxFit.cover)  :const DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZUX7zo1yYFaBeOYIcOfcgwnULvpM7YqzXxA&usqp=CAU"),fit: BoxFit.cover)
                ),
              ),
            ),
            SizedBox(height: w*0.008,),
            InkWell(
              onTap: () {
                selectFileToMessage("poppins");
                value=true;
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
            SizedBox(height: h*0.05,),
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
                        labelText: "name",
                        labelStyle:
                        TextStyle(fontSize: w * 0.015, fontWeight: FontWeight.w500),
                        hintText: "Please enter name",
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
                      controller: category,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(fontSize: w * 0.015, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        filled: true,
                        labelText: "category",
                        labelStyle:
                        TextStyle(fontSize: w * 0.015, fontWeight: FontWeight.w500),
                        hintText: "category",
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
            SizedBox(height: h*0.05,),
            InkWell(
              onTap: () {
                addPoppins();
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
                        offset: const Offset(0, 4),
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
            SizedBox( height: h*0.05,),
            ref.watch(streamtoppings).when(data: (data){
              return SizedBox(
                height: h*1.5,
                width: w*1.5,
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,crossAxisSpacing: w*0.03),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: h*0.25,
                          width: w*0.3,
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
mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("name: ${data[index].name}",style: TextStyle(

                                      fontSize: w*0.02,
                                      color: Colors.white
                                  ),),
                                Text("category: ${data[index].category}",style: TextStyle(

                                      fontSize: w*0.02,
                                      color: Colors.white
                                  ),),

                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: h*0.13,
                                    width: w*0.06,
                                    decoration: BoxDecoration(
                                      color: ColorConst.primerycolor,


                                    ),
                                    child: Image.network(data[index].image,fit: BoxFit.fill,),
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
