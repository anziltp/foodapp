import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
     body: Column(
        children: [
          Text("Orders",style: TextStyle(fontWeight: FontWeight.w700),),
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: h*0.25,
                width: w*0.2,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
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
                  Icon(Icons.file_copy_rounded),
                  SizedBox(width: w*0.0,),
                  Text("orders",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.black),)
                ],
              ),
                        ),
                    Row(
                      children: [
                        Icon(CupertinoIcons.money_dollar),
                        Text("233.554",style: TextStyle(fontWeight: FontWeight.w800),),
                        Text("+45%"),
                        Icon(CupertinoIcons.up_arrow)
                      ],
                    ),
                    Row( children: [
                      Text('compared to(25,450 last year')
                    ],),
                    ]
                ),
            ),
    ),
              Container(
                height: h*0.25,
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
                  Icon(Icons.auto_graph_outlined),
                  SizedBox(width: w*0.0,),
                  Text("avg.order amt",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.black),)
                ],
              ),
                        ),
                    Row(
                      children: [
                        Icon(CupertinoIcons.money_dollar),
                        Text("233.554",style: TextStyle(fontWeight: FontWeight.w800),),
                        Text("+45%"),
                        Icon(CupertinoIcons.arrow_down)
                      ],
                    ),
                    Row( children: [
                      Text('compared to(25,450 last year')
                    ],),
                    ]
                ),
            ),
    ),

              Container(
                height: h*0.25,
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
                              Icon(Icons.person),
                              SizedBox(width: w*0.0,),
                              Text("Unigue Customers",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.black),)
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(CupertinoIcons.money_dollar),
                            Text("15,235",style: TextStyle(fontWeight: FontWeight.w800),),
                            Text("+2.5%"),
                            Icon(CupertinoIcons.up_arrow)
                          ],
                        ),
                        Row( children: [
                          Text('compared to(25,450 last year')
                        ],),
                      ]
                  ),
                ),
              ),

              Container(
                height: h*0.25,
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
                            Icon(Icons.leaderboard),
                            SizedBox(width: w*0.0,),
                            Text("avg.order amt",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.black),)
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(CupertinoIcons.money_dollar),
                          Text("9,554",style: TextStyle(fontWeight: FontWeight.w800),),
                          Text("+2.8%"),
                          Icon(CupertinoIcons.arrow_down)
                        ],
                      ),
                      Row(

                          children: [
                        Text('compared to(25,450 last year')
                      ],),
                    ]
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
