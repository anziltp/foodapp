import 'package:flutter/material.dart';
import 'package:foodapp/sidemenu%20part/product%20_Adding/add_products.dart';

import '../../constans/color_const.dart';
import '../../main.dart';

class ProductHome extends StatefulWidget {
  const ProductHome({super.key});

  @override
  State<ProductHome> createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("latest products")
            ],
          ),
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
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => AddProducts(),));
                  },
                  child: Container(
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
                        Icon(Icons.add),
                        Text(
                          "Add Products",
                          style: TextStyle(
                              color: ColorConst.primerycolor,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
