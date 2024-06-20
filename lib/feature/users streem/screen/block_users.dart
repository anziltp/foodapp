import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constans/color_const.dart';
import '../../../constans/snack_bar_page.dart';
import '../../../main.dart';
import '../condroller/streem_condroller.dart';
import '../repositry/streem_repositry.dart';

class BlockUsers extends ConsumerStatefulWidget{
  const BlockUsers({super.key});

  @override
  ConsumerState<BlockUsers> createState() => _BlockUsersState();
}

class _BlockUsersState extends ConsumerState<BlockUsers> {
  deleteUser(String id) {
    ref.read(userDataRepository).deleteUser(id);
    showSnackBar(context, "Deleting.....");
  }
  final search = StateProvider((ref) => "");
TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(w * 0.01),
        child: Column(

          children: [
            SizedBox(
              height: w * 0.03,
              width: w * 0.4,
              //color: Colors.red,
              child: TextFormField(
                controller: searchController,
                style: TextStyle(color: ColorConst.black),
                onChanged: (value) {
                  ref
                      .read(search.notifier)
                      .update((state) => value.toString().toUpperCase());
                },
                decoration: InputDecoration(
                  label: Text("Search ......"),
                  suffixIcon: Padding(
                    padding:  EdgeInsets.only(right: w*0.01),
                    child: Icon(CupertinoIcons.search,color: Colors.grey,),
                  ),

                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorConst.black),
                      borderRadius: BorderRadius.circular(w * 0.04)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:ColorConst.black),
                      borderRadius: BorderRadius.circular(w * 0.04)),
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: h*0.04,),
            Expanded(
                child:ref.watch(streamBlockUsers(ref.watch(search))).when(
                  data: (data) {
                    // print("---------------------------");
                    // print(data);
                    return GridView.builder(
                      itemCount: data.length,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: w * 0.1,
                        mainAxisSpacing: w * 0.02,
                        crossAxisSpacing: w * 0.02,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          height: w * 0.08,
                          width: w * 0.5,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(w * 0.04),
                            gradient:  LinearGradient(

                                colors: [ColorConst.Grey,ColorConst.Grey2]),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(w * 0.01),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: w * 0.04,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                  NetworkImage(data[index].image),
                                ),
                                SizedBox(
                                  width: w * 0.03,
                                ),
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      data[index].name,
                                    ),
                                    Text(data[index].email),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                    title: const Center(
                                                        child: Text(
                                                            "view full details")),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(w *
                                                            0.03)),
                                                    content: SizedBox(
                                                      height: w * 0.4,
                                                      width: w * 0.5,
                                                      child: Column(
                                                        children: [
                                                          CircleAvatar(
                                                            radius:
                                                            w * 0.06,
                                                            backgroundColor:
                                                            Colors
                                                                .white,
                                                            backgroundImage:
                                                            NetworkImage(
                                                                data[index]
                                                                    .image),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                            h * 0.04,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                "Name : ${data[index].name}",
                                                                style:
                                                                TextStyle(
                                                                  fontSize:
                                                                  w * 0.02,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: h *
                                                                    0.03,
                                                              ),
                                                              Text(
                                                                "Email : ${data[index].email}",
                                                                style: TextStyle(
                                                                    fontSize: w *
                                                                        0.02,
                                                                    fontWeight:
                                                                    FontWeight.w800),
                                                              ),
                                                              SizedBox(
                                                                height: h *
                                                                    0.03,
                                                              ),
                                                              Text(
                                                                "Password : ${data[index].password}",
                                                                style: TextStyle(
                                                                    fontSize: w *
                                                                        0.02,
                                                                    fontWeight:
                                                                    FontWeight.w800),
                                                              ),
                                                              SizedBox(
                                                                height: h *
                                                                    0.03,
                                                              ),
                                                              Text(
                                                                "id : ${data[index].id}",
                                                                style: TextStyle(
                                                                    fontSize: w *
                                                                        0.02,
                                                                    fontWeight:
                                                                    FontWeight.w800),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ));
                                              },
                                            );
                                          },
                                          child: Container(
                                            height: h * 0.05,
                                            width: w * 0.08,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  w * 0.04),
                                              color: ColorConst.white,
                                            ),
                                            child: const Center(
                                                child: Text(
                                                  "View",
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w800),
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          width: w * 0.02,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // ref.read(userControllerRepository).blockuser(data[index].id, data[index]);
                                            showCupertinoModalPopup(
                                              context: context,
                                              builder: (context) {
                                                return CupertinoAlertDialog(
                                                  title: const Text(
                                                      "Are you sure\nYou want to UnBlock"),
                                                  actions: [
                                                    Column(
                                                      children: [
                                                        CupertinoDialogAction(
                                                          child: Text(
                                                            "yes",
                                                            style: TextStyle(
                                                                fontSize: w *
                                                                    0.01,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w800,
                                                                color: Colors
                                                                    .red),
                                                          ),
                                                          onPressed: () {
                                                            ref
                                                                .read(
                                                                userControllerRepository)
                                                                .unblockuser(
                                                                data[index]
                                                                    .id,
                                                                data[
                                                                index]);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                        const Divider(),
                                                        CupertinoDialogAction(
                                                          child: Text(
                                                            "cancel",
                                                            style: TextStyle(
                                                                fontSize: w *
                                                                    0.01,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            height: h * 0.05,
                                            width: w * 0.08,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  w * 0.04),
                                              color: ColorConst.white,
                                            ),
                                            child: const Center(
                                                child: Text(
                                                  "UnBlock",
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w800),
                                                )),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showCupertinoModalPopup(
                                      context: context,
                                      builder: (context) {
                                        return CupertinoAlertDialog(
                                          title: const Text(
                                              "Are you sure\nYou want to delete"),
                                          actions: [
                                            Column(
                                              children: [
                                                CupertinoDialogAction(
                                                  child: Text(
                                                    "yes",
                                                    style: TextStyle(
                                                        fontSize: w * 0.01,
                                                        fontWeight:
                                                        FontWeight.w800,
                                                        color: Colors.red),
                                                  ),
                                                  onPressed: () {
                                                    deleteUser(
                                                        data[index].id);
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                const Divider(),
                                                CupertinoDialogAction(
                                                  child: Text(
                                                    "cancel",
                                                    style: TextStyle(
                                                        fontSize: w * 0.01,
                                                        fontWeight:
                                                        FontWeight
                                                            .w800),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            )
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Padding(
                                    padding:
                                    EdgeInsets.only(left: w * 0.02),
                                    child: const Icon(Icons.delete),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) => Column(
                    children: [
                       Text(error.toString()),
                       Text('==============================='),
                       Text(stackTrace.toString()),
                    ],
                  ),
                  loading: () =>  Center(child: CircularProgressIndicator()),
                )),
        ]
      ),
    )
    );
  }
}
