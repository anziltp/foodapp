import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/constans/image_const.dart';
import 'package:foodapp/feature/adding_category/screen/category_page.dart';
import 'package:foodapp/constans/color_const.dart';
import 'package:foodapp/feature/bookings/screen/bookings_users.dart';
import 'package:foodapp/login%20part/create_account.dart';
import 'package:foodapp/feature/admin_adding/screen/admin_page.dart';
import 'package:foodapp/feature/adding_banner/screen/banner_page.dart';

import 'package:foodapp/sidemenu%20part/dashboard.dart';
import 'package:foodapp/sidemenu%20part/product%20_Adding/product_Home.dart';
import 'package:foodapp/feature/users%20streem/screen/users.dart';
import 'package:side_navigation/side_navigation.dart';

import '../constans/color_const.dart';
import '../constans/image_const.dart';
import '../main.dart';

String? file;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  /// Views to display
  List<Widget> views = const [
    UsersPage(),
    BookingUser(),
    AddItems(),
    ProductHome(),
    BannerPage(),
    AdminPage()
  ];

  List<Widget> nonAdminViews = const [
    UsersPage(),
    BookingUser(),
    AddItems(),
    ProductHome(),
    BannerPage(),
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
          currentRole == "Super Admin" ? SideNavigationBar(
            selectedIndex: selectedIndex,
            theme: SideNavigationBarTheme(
                itemTheme: SideNavigationBarItemTheme(
                    unselectedItemColor: ColorConst.black,
                    selectedItemColor: ColorConst.primerycolor),
                togglerTheme: SideNavigationBarTogglerTheme(
                    expandIconColor: ColorConst.primerycolor),
                dividerTheme: SideNavigationBarDividerTheme.standard()),
            footer: SideNavigationBarFooter(
                label: InkWell(
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: const Text("Are you sure\nYou want to Exit"),
                      actions: [
                        Column(
                          children: [
                            CupertinoDialogAction(
                              child: Text(
                                "yes",
                                style: TextStyle(
                                    fontSize: w * 0.01,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.red),
                              ),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => const CreatePage(),
                                    ),
                                    (route) => false);
                              },
                            ),
                            const Divider(),
                            CupertinoDialogAction(
                              child: Text(
                                "cancel",
                                style: TextStyle(
                                    fontSize: w * 0.01,
                                    fontWeight: FontWeight.w800),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Exit",
                    style: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: w * 0.015),
                  ),
                  SizedBox(
                    width: w * 0.01,
                  ),
                  const Icon(Icons.exit_to_app)
                ],
              ),
            )),
            header: SideNavigationBarHeader(
              image: Image.asset(
                ImageConst.splashscreen,
                width: w * 0.07,
              ),
              title: Text(
                "Yum Yard",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: w * 0.013,
                    color: ColorConst.primerycolor),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(left: w * 0.001,top: w*0.001),
                child: const Text(
                  "Super Admin",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.black),
                ),
              ),
            ),
            items: const [
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
              SideNavigationBarItem(
                icon: Icons.photo_library_outlined,
                label: 'Banner',
              ),
              SideNavigationBarItem(
                icon: Icons.person_3,
                label: 'Admin',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ) : SideNavigationBar(
            selectedIndex: selectedIndex,
            theme: SideNavigationBarTheme(
                itemTheme: SideNavigationBarItemTheme(
                    unselectedItemColor: ColorConst.black,
                    selectedItemColor: ColorConst.primerycolor),
                togglerTheme: SideNavigationBarTogglerTheme(
                    expandIconColor: ColorConst.primerycolor),
                dividerTheme: SideNavigationBarDividerTheme.standard()),
            footer: SideNavigationBarFooter(
                label: InkWell(
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Text("Are you sure\nYou want to Exit"),
                          actions: [
                            Column(
                              children: [
                                CupertinoDialogAction(
                                  child: Text(
                                    "yes",
                                    style: TextStyle(
                                        fontSize: w * 0.01,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.red),
                                  ),
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) => const CreatePage(),
                                        ),
                                            (route) => false);
                                  },
                                ),
                                const Divider(),
                                CupertinoDialogAction(
                                  child: Text(
                                    "cancel",
                                    style: TextStyle(
                                        fontSize: w * 0.01,
                                        fontWeight: FontWeight.w800),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Exit",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: w * 0.015),
                      ),
                      SizedBox(
                        width: w * 0.01,
                      ),
                      const Icon(Icons.exit_to_app)
                    ],
                  ),
                )),
            header: SideNavigationBarHeader(
              image: Image.asset(
                ImageConst.splashscreen,
                width: w * 0.07,
              ),
              title: Text(
                "Yum Yard",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: w * 0.013,
                    color: ColorConst.primerycolor),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(left: w * 0.01),
                child: const Text(
                  "admin",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.black),
                ),
              ),
            ),
            items: const [
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
              SideNavigationBarItem(
                icon: Icons.photo_library_outlined,
                label: 'Banner',
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
            child: currentRole=="Super Admin" ? views.elementAt(selectedIndex) : nonAdminViews.elementAt(selectedIndex),
          )
        ],
      ),
    );
  }
}
