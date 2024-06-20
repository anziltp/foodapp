import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constans/color_const.dart';
import '../../adding_category/controller/category_controller.dart';
import '../../../main.dart';
import 'add_products.dart';

class ProductHome extends ConsumerStatefulWidget {
  const ProductHome({super.key});

  @override
  ConsumerState<ProductHome> createState() => _ProductHomeState();
}

class _ProductHomeState extends ConsumerState<ProductHome> {
  String? chooseitem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: h*0.03,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Text("Latest Products",style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: w*0.02
                ),))
              ],
            ),
            SizedBox(height: h*0.03 ,),
            ref.watch(streamDataProvider).when(data: (data) {
              return SizedBox(
                height: h*1,
                width: w*1,
                // color: Colors.green,
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,crossAxisSpacing: w*0.01,mainAxisSpacing: w*0.01,childAspectRatio: 1.7),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                  return Container(
                    height: h*0.1,
                    width: w*0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w*0.01),
                      border: Border.all(),
                      gradient:  LinearGradient(

                          colors: [ColorConst.Grey,ColorConst.Grey2]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: h*0.13,
                            width: w*0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.03)
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: h*0.13,
                                    width: w*0.15,
                                    color: Colors.black,
                                    child: Image(image: NetworkImage(data[index].image))),
                              ],
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(data[index].category,style: TextStyle(
                                fontSize: w*0.015,
                                color: Colors.white,
                                fontWeight: FontWeight.w800
                            ),),
                            TextButton(onPressed: () {
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => AddProducts(category: data[index],),));
                            }, child: Container(
                              height: h*0.05,
                                width: w*0.06,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(w*0.03)
                                ),
                                child: const Center(child: Text("Add Items",style: TextStyle(
                                  color: Colors.black
                                ),))))
                          ],
                        )
                      ],
                    ),
                  );
                },));
            }, error: (error, stackTrace) {
              return Text(error.toString());
            }, loading: () => const CircularProgressIndicator(),),
            Padding(
              padding:  EdgeInsets.all(w*0.07),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: w * 0.04,
                    width: w * 0.1,
                    decoration: BoxDecoration(
                        color: ColorConst.white,
                        borderRadius: BorderRadius.circular(w * 0.06),
                        border: Border.all(
                            color: ColorConst.Grey, width: w * 0.003)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.photo),
                        Text(
                          "View All",
                          style: TextStyle(
                              color: ColorConst.primerycolor,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                //   InkWell(
                //     onTap: () {
                //       Navigator.push(context, CupertinoPageRoute(builder: (context) => AddProducts(categoryId: data[index].id,),));
                //     },
                //     child: Container(
                //       height: w * 0.04,
                //       width: w * 0.1,
                //       decoration: BoxDecoration(
                //           color: ColorConst.white,
                //           borderRadius: BorderRadius.circular(w * 0.06),
                //           border: Border.all(
                //               color: ColorConst.primerycolor, width: w * 0.003)),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: [
                //           Icon(Icons.add),
                //           Text(
                //             "Add Products",
                //             style: TextStyle(
                //                 color: ColorConst.primerycolor,
                //                 fontWeight: FontWeight.w900),
                //           ),
                //         ],
                //       ),
                //     ),
                //     // InkWell(
                //     //   onTap: () {
                //     //     Navigator.push(
                //     //         context,
                //     //         CupertinoPageRoute(
                //     //           builder: (context) => AddProducts(),
                //     //         ));
                //     //   },
                //     //   child: Container(
                //     //     height: w * 0.04,
                //     //     width: w * 0.1,
                //     //     decoration: BoxDecoration(
                //     //         color: ColorConst.white,
                //     //         borderRadius: BorderRadius.circular(w * 0.06),
                //     //         border: Border.all(
                //     //             color: ColorConst.primerycolor, width: w * 0.003)),
                //     //     child: Row(
                //     //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     //       children: [
                //     //         Icon(Icons.add),
                //     //         Text(
                //     //           "Add Products",
                //     //           style: TextStyle(
                //     //               color: ColorConst.primerycolor,
                //     //               fontWeight: FontWeight.w900),
                //     //         ),
                //     //       ],
                //     //     ),
                //     //   ),
                //     // ),
                // ),
           ]
              ),
          ),
        ]
        ),
      )
    );
  }
}
