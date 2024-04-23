import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/feature/adding_banner/condroller/banner_controller.dart';

import '../../../constans/snack_bar_page.dart';
import '../../../main.dart';

class BannerPage extends ConsumerStatefulWidget {
  const BannerPage({super.key});

  @override
  ConsumerState<BannerPage> createState() => _BannerPageState();
}

class _BannerPageState extends ConsumerState<BannerPage> {
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

  addBanner() {
    ref.read(bannerControllerProvider).banner( image: coverImage.toString(),id: "");
    showSnackBar(context, "Uploading...");
    coverImage = "";

  }
  deleteBanner(String id){
    ref.read(bannerControllerProvider).deletebanner(id);
    showSnackBar(context, "Deleting.....");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( elevation: 0,),
      body: SingleChildScrollView(
        child: Column(
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
              child: value==true?Image.network(coverImage.toString(),fit: BoxFit.fill,scale: 2,): Icon(Icons.image,size: w*0.05,),
            ),
            SizedBox(height: h*0.05,),
            Center(
              child: GestureDetector(
                onTap: () {
                  value=true;
                  selectFileToMessage("food");
                },
                child: Container(
                  height: h * 0.05,
                  width: w * 0.06,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.3, 0.7],
                          colors: [Color(0xffF9881F), Color(0xffFF774C)]),
                      borderRadius: BorderRadius.circular(w * 0.06)),
                  child: Center(
                      child: Text(
                        "Add ",
                        style: TextStyle(
                            fontSize: w * 0.012,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                ),
              ),
            ),
            SizedBox(height: h*0.04,),
            InkWell(
              onTap: () {
                addBanner();
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
                      "upload",
                      style: TextStyle(
                          fontSize: w * 0.012,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
              ),
            ),
            SizedBox(height: w*0.03,),
        
            Padding(
              padding:  EdgeInsets.all(w*0.03),
              child: ref.watch(streambanner).when(data: (data){
                return SizedBox(
                  height: h*1,
                  width: w*1,
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
                                Container(
                                  height: h*0.13,
                                  width: w*0.06,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(w*0.02),
                                  ),
                                  child: Container(
                                    height: w*0.05,
                                      width: w*0.07,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(w*0.01),
                                        color: Colors.white
                                      ),
                                      child: Image.network(data[index].image,fit: BoxFit.fill,)),
                                ),
                                InkWell(
                                  onTap: () {
                                    deleteBanner(data[index].id);
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
                },),
            )
          ],
        ),
      ),
    );
  }
}
