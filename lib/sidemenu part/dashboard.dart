import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodapp/constans/color_const.dart';
import 'package:foodapp/constans/image_const.dart';

import '../main.dart';

class Dashbored extends StatefulWidget {
  const Dashbored({super.key});

  @override
  State<Dashbored> createState() => _DashboredState();
}

class _DashboredState extends State<Dashbored> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(w*0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Text("OverView",style: TextStyle(fontWeight: FontWeight.w700,fontSize: w*0.02),),
                ],
              ),
            ),
            Row(
        
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: h*0.2,
                  width: w*0.2,
                  decoration: BoxDecoration(
                      color: ColorConst.primerycolor,
                      borderRadius:  BorderRadius.circular(w*0.02),
                      boxShadow:[BoxShadow(blurRadius: w*0.002)]
                  ),
                  child:  Padding(
                    padding:  EdgeInsets.only(left: w*0.01),
                    child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.all(w*0.01),
                            child: Row(
                              children: [
                                const Icon(Icons.file_copy_rounded),
                                SizedBox(width: w*0.01,),
                                const Text("orders",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.black),)
                              ],
                            ),
                          ),
                          SizedBox(height: w*0.01,),
                          const Row(
                            children: [
                              Icon(CupertinoIcons.money_dollar),
                              Text("233.554",style: TextStyle(fontWeight: FontWeight.w800),),
                              Text("+45%"),
                              Icon(CupertinoIcons.up_arrow)
                            ],
                          ),
                          SizedBox(height: w*0.01,),
                          const Row( children: [
                            Text('compared to(25,450 last year')
                          ],),
                        ]
                    ),
                  ),
                ),
                Container(
                  height: h*0.2,
                  width: w*0.2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:  BorderRadius.circular(w*0.02),
                      boxShadow:[BoxShadow(blurRadius: w*0.002)]
                  ),
                  child:  Padding(
                    padding:  EdgeInsets.only(left: w*0.01),
                    child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.all(w*0.01),
                            child: Row(
                              children: [
                                const Icon(Icons.auto_graph_outlined),
                                SizedBox(width: w*0.01,),
                                const Text("avg.order amt",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.black),)
                              ],
                            ),
                          ),
                          SizedBox(height: w*0.01,),
                          const Row(
                            children: [
                              Icon(CupertinoIcons.money_dollar),
                              Text("233.554",style: TextStyle(fontWeight: FontWeight.w800),),
                              Text("+45%"),
                              Icon(CupertinoIcons.arrow_down)
                            ],
                          ),
                          SizedBox(height: w*0.01,),
                          const Row( children: [
                            Text('compared to(25,450 last year')
                          ],),
                        ]
                    ),
                  ),
                ),
        
                Container(
                  height: h*0.2,
                  width: w*0.2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:  BorderRadius.circular(w*0.02),
                      boxShadow:[BoxShadow(blurRadius: w*0.002)]
                  ),
                  child:  Padding(
                    padding:  EdgeInsets.only(left: w*0.01),
                    child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.all(w*0.01),
                            child: Row(
                              children: [
                                const Icon(Icons.person),
                                SizedBox(width: w*0.01,),
                                const Text("Unigue Customers",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.black),)
                              ],
                            ),
                          ),
                          SizedBox(height: w*0.01,),
                          const Row(
                            children: [
                              Icon(CupertinoIcons.money_dollar),
                              Text("15,235",style: TextStyle(fontWeight: FontWeight.w800),),
                              Text("+2.5%"),
                              Icon(CupertinoIcons.up_arrow)
                            ],
                          ),
                          SizedBox(height: w*0.01,),
                          const Row( children: [
                            Text('compared to(25,450 last year')
                          ],),
                        ]
                    ),
                  ),
                ),
        
                Container(
                  height: h*0.2,
                  width: w*0.2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:  BorderRadius.circular(w*0.02),
                      boxShadow:[BoxShadow(blurRadius: w*0.002)]
                  ),
                  child:  Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(w*0.01),
                          child: Row(
                            children: [
                              const Icon(Icons.leaderboard),
                              SizedBox(width: w*0.01,),
                              const Text("Net Sales",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.black),)
                            ],
                          ),
                        ),
                        SizedBox(height: w*0.01,),
                        const Row(
                          children: [
                            Icon(CupertinoIcons.money_dollar),
                            Text("9,554",style: TextStyle(fontWeight: FontWeight.w800),),
                            Text("+2.8%"),
                            Icon(CupertinoIcons.arrow_down)
                          ],
                        ),
                        SizedBox(height:w* 0.01,),
                        const Row(
        
                          children: [
                            Text('compared to(25,450 last year')
                          ],),
                      ]
                  ),
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.all(w*0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 Container(
                   height: w*0.33,
                   width: w*0.45,
                   decoration: BoxDecoration(
                       color: Colors.greenAccent,
                     borderRadius: BorderRadius.circular(w*0.03)
                   ),

                 ),
                  Column(
                    children: [
                      Container(
                        height: h*0.5,
                        width: w*0.2,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(w*0.03)
                        ),
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {

                        return Padding(
                          padding:  EdgeInsets.all(w*0.01),
                          child: Container(
                           height: h*0.09,
                            width:w*0.09,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(w*0.03),
                             color: Colors.white
                           ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: w*0.03,
                                  backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.lvo_KabXt4QK00Ad0aOskgHaE8?w=334&h=182&c=7&r=0&o=5&dpr=1.3&pid=1.7")),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("special chiken",style: TextStyle(fontWeight: FontWeight.w800),),
                                    Text("3245+ orders")
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                        },
                            separatorBuilder:  (context, index) {
                           return SizedBox(height: w*0.01,);
                        },
                            itemCount: 1),
                      ),
SizedBox(height: w*0.01,),
Container(
  height: h*0.15,
  width: w*0.2,

  decoration: BoxDecoration(borderRadius: BorderRadius.circular(w*0.03),
    color: Colors.redAccent,),
  child: Column(

    children: [
      Text("delivery boys"),
      Expanded(
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return
        CircleAvatar(
        radius: w*0.03,
        backgroundColor: Colors.cyan,
        backgroundImage:NetworkImage("https://th.bing.com/th/id/OIP.lvo_KabXt4QK00Ad0aOskgHaE8?w=334&h=182&c=7&r=0&o=5&dpr=1.3&pid=1.7") ,
        );
        }, separatorBuilder: (context, index) {
          return SizedBox(width: w*0.01,);
        
        }, itemCount: 1),
      ),
    ],
  ),
)
                    ],
                  )
                ],
              ),
            )
          ],
          ///fgfgf
        ),
      ),
    );
  }
}
