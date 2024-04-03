import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/models/category_model.dart';

import '../../constans/color_const.dart';
import '../../feature/adding_category/controller/category_controller.dart';
import '../../feature/adding_products/controller/item_controller.dart';
import '../../main.dart';
import '../../feature/adding_products/screen/add_products.dart';

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
                Center(child: Text("latest products",style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: w*0.02
                ),))
              ],
            ),
            ref.watch(streamDataProvider).when(data: (data) {
              return ListView.separated(
                shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => AddProducts(category: data[index],),));
                  },
                  child: Container(
                    height: h*0.2,
                    width: w*0.5,
                    color: Colors.yellow,
                    child: Column(
                      children: [
                        Container(
                            height: h*0.1,
                            child: Image(image: NetworkImage(data[index].image))),
                        Text(data[index].category)
                      ],
                    ),
                  ),
                );
              }, separatorBuilder: (context, index) {
                return SizedBox(height: w*0.03,);
              }, itemCount: data.length);
            }, error: (error, stackTrace) {
              return Text(error.toString());
            }, loading: () => CircularProgressIndicator(),),
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
                            color: ColorConst.primerycolor, width: w * 0.003)),
                    child: Row(
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
