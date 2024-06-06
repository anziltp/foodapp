import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodapp/constans/color_const.dart';
import 'package:foodapp/feature/bookings/screen/bookings.dart';
import 'package:foodapp/feature/users%20streem/condroller/streem_condroller.dart';
import 'package:foodapp/feature/users%20streem/screen/block_users.dart';

import '../../../constans/setsearchparam.dart';
import '../../../constans/snack_bar_page.dart';
import '../../../main.dart';

class BookingUser extends ConsumerStatefulWidget {
  const BookingUser({super.key});

  @override
  ConsumerState<BookingUser> createState() => _UsersPageState();
}

class _UsersPageState extends ConsumerState<BookingUser> {


  TextEditingController searchController=TextEditingController();
  final search = StateProvider((ref) => "");
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
            // ElevatedButton(onPressed: () async {
            //
            //   var data=await FirebaseFirestore.instance.collection("Users").get();
            //   for (var docs in data.docs){
            //
            //     FirebaseFirestore.instance.collection("Users").doc(docs["id"]).update(
            //         {
            //           "search":setSearchParam(
            //             docs["name"]+" "+
            //             docs["email"]
            //
            //           )
            //
            //         });
            //   }
            //
            // }, child: Text("add")),

            Expanded(
                child: ref.watch(streamUsers(ref.watch(search))).when(
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
                            border: Border.all(color: ColorConst.seondarycolor),
                            borderRadius: BorderRadius.circular(w * 0.04),
                            color: Colors.white60
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(w * 0.01),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: h*0.2,
                                width: w*0.09,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(w*0.02),
                                   color: ColorConst.primerycolor
                                 ),
                                child: Image(image: NetworkImage(data[index].image,),fit: BoxFit.fill,),
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
                                            Navigator.push(context, CupertinoPageRoute(builder: (context) => Bookings(data[index].id),));
                                          },
                                          child: Container(
                                            height: h * 0.05,
                                            width: w * 0.08,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  w * 0.04),
                                              color: ColorConst.primerycolor
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

                                      ],
                                    )
                                  ],
                                ),

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
          ],
        ),
      ),
    );
  }
}
