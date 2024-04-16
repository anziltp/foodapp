import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodapp/constans/color_const.dart';
import 'package:foodapp/constans/image_const.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../main.dart';
class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
class Dashbored extends StatefulWidget {
  const Dashbored({super.key});

  @override
  State<Dashbored> createState() => _DashboredState();
}
List food=[
  {
    "items":"https://coolfooddude.com/wp-content/uploads/2020/08/SFS_Classic_Sirloin_Blend_030-2-scaled.jpg",
    "name":"burger",
    "order":"3100+orders"
  },
  {
    "items":"https://th.bing.com/th/id/OIP.ildCrKedl5wZSDvDouexMQHaEo?rs=1&pid=ImgDetMain",
    "name":"pizza",
    "order":"3100+orders"
  },
  {
    "items":"https://th.bing.com/th/id/OIP.XEu76rG-R9zr60weudFvWgHaHa?w=2590&h=2590&rs=1&pid=ImgDetMain",
    "name":"chicken fry",
    "order":"3100+orders"
  },
  {
    "items":"https://th.bing.com/th/id/OIP.ltbGhp_gCKKtHR2oRQWR5gHaEK?rs=1&pid=ImgDetMain",
    "name":"shawarma",
    "order":"3100+orders"
  }, {
    "items":"https://th.bing.com/th/id/OIP.RpORXC6CvWeFKbGxnNXlzAHaFP?rs=1&pid=ImgDetMain",
    "name":"sandwich",
    "order":"3100+orders"
  },


];
List deliver=[

  {
    "boy":"https://static.foxnews.com/foxnews.com/content/uploads/2022/12/lionel-messi1.jpg"
  },
  {
    "boy":"https://static.fanpage.it/wp-content/uploads/sites/27/2020/04/cristiano-ronaldo-real-madrid.jpg"
  },
  {
    "boy":"https://th.bing.com/th/id/OIP.F5mNKW0SbOT_HgvtnQu0DgHaFC?rs=1&pid=ImgDetMain"
  },
  {
    "boy":"https://superstarsbio.com/wp-content/uploads/2019/01/Mesut-Ozil-1.jpg"
  }
];
class _DashboredState extends State<Dashbored> {
  List<_SalesData> data = [
    _SalesData('Jan', 30),
    _SalesData('Feb', 28),
    _SalesData('Mar', 20),
    _SalesData('Apr', 25),
    _SalesData('May', 19)
  ];
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
                       color: Colors.white,
                     boxShadow: [BoxShadow(color: Colors.black,blurRadius: w*0.001)],
                     borderRadius: BorderRadius.circular(w*0.03)
                   ),
child: SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    // Chart title
    title: ChartTitle(text: 'Half yearly sales analysis'),
    // Enable legend
    legend: Legend(isVisible: true),
    // Enable tooltip
    tooltipBehavior: TooltipBehavior(enable: true),
    series: <CartesianSeries<_SalesData, String>>[
      LineSeries<_SalesData, String>(
          dataSource: data,
          xValueMapper: (_SalesData sales, _) => sales.year,
          yValueMapper: (_SalesData sales, _) => sales.sales,
          name: 'Sales',
          // Enable data label
          dataLabelSettings: DataLabelSettings(isVisible: true))
    ]),
                 ),
                  Column(
                    children: [
                      Container(
                        height: h*0.7,
                        width: w*0.2,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(w*0.03)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(top:w*0.01,left:w* 0.02),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                   Text("most popular items",style: TextStyle(fontWeight: FontWeight.w800),),
                                ],
                              ),
                            ),
                            ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,

                                physics: BouncingScrollPhysics(
                                ),
                                itemBuilder: (context, index) {

                            return Padding(
                              padding:  EdgeInsets.only(top:w*0.01,left: w*0.01,right: w*0.01),
                              child: Container(
                               height: h*0.09,
                                width:w*0.09,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(w*0.03),
                                 color: Colors.white,
                                 boxShadow: [BoxShadow(color: ColorConst.primerycolor,blurRadius: w*0.002)]
                               ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: w*0.03,
                                      backgroundImage: NetworkImage(food[index]["items"],),),

                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(food[index]["name"],style: TextStyle(fontWeight: FontWeight.w800),),
                                        Text(food[index]["order"])
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                            },
                                separatorBuilder:  (context, index) {
                               return SizedBox(height: w*0.001,);
                            },
                                itemCount: food.length),
                          ],
                        ),
                      ),


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
