
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/constans/image_const.dart';
import 'package:foodapp/feature/adding_category/screen/category_page.dart';
import 'package:flutter/widgets.dart';
import 'package:foodapp/constans/color_const.dart';
import 'package:foodapp/sidemenu%20part/booking.dart';
import 'package:foodapp/sidemenu%20part/dashboard.dart';
import 'package:foodapp/sidemenu%20part/product%20_Adding/product_Home.dart';
import 'package:foodapp/feature/users%20streem/screen/users.dart';
import 'package:side_navigation/side_navigation.dart';

import 'constans/color_const.dart';
import 'constans/image_const.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

TextEditingController name = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController email = TextEditingController();

class _HomePageState extends State<HomePage> {
  /// Views to display
  List<Widget> views = const [
    Dashbored(),
    UsersPage(),
    Bookings(),
    AddItems(),
    ProductHome(),
  ];

  /// The currently selected index of the bar
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// You can use an AppBar if you want to
      appBar: AppBar(
        backgroundColor: ColorConst.seondarycolor,
        elevation: 0,
        title: const Center(child: Text('Food App')),
      ),

      // The row is needed to display the current view
      body: Row(
        children: [
          /// Pretty similar to the BottomNavigationBar!
          SideNavigationBar(
            selectedIndex: selectedIndex,
            footer: SideNavigationBarFooter(label: InkWell(
              onTap: () {
                showCupertinoModalPopup(context: context, builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Text("Are you sure\nYou want to Exit"),
                    actions: [
                      Column(
                        children: [
                          CupertinoDialogAction(child: Text("yes",style: TextStyle(fontSize: w*0.01,fontWeight: FontWeight.w800,color: Colors.red),)),
                          const Divider(),
                          CupertinoDialogAction(child: Text("cancel",style: TextStyle(fontSize: w*0.01,fontWeight: FontWeight.w800),)
                            ,onPressed: () {
                              Navigator.pop(context);
                            },),

                        ],
                      )
                    ],
                  );
                },);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Exit",style: TextStyle(fontWeight: FontWeight.w700,fontSize: w*0.015),),
                  SizedBox(width: w*0.01,),
                  const Icon(Icons.exit_to_app)
                ],
              ),
            )),
            header: SideNavigationBarHeader(image: Image.asset(ImageConst.splashscreen,width: w*0.07,), title:  Text("Yum Yard",style: TextStyle(fontWeight: FontWeight.w700,fontSize: w*0.012,color: ColorConst.primerycolor),), subtitle: Padding(
              padding:  EdgeInsets.only(left:w*0.01),
              child: const Text("admin",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.grey),),
            )),
            items: const [

              SideNavigationBarItem(

                icon: Icons.dashboard,
                label: 'Dashboard',

              ),
              SideNavigationBarItem(
                icon: Icons.person,
                label: 'users',

              ),
              SideNavigationBarItem(
                icon: Icons.production_quantity_limits_outlined,
                label: 'Bookings',
              ),
              SideNavigationBarItem(
                icon: Icons.import_export,
                label: 'Categories',
              ),
              SideNavigationBarItem(
                icon: Icons.production_quantity_limits,
                label: 'Items',
              ),

            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),

          /// Make it take the rest of the available width
          Expanded(
            child: views.elementAt(selectedIndex),
          )
        ],
      ),
    );
  }
}