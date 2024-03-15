import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'constans/color_const.dart';
import 'constans/image_const.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    // Connect SideMenuController and PageController together
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<SideMenuItem> items = [
      SideMenuItem(
        title: 'Dashboard',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: Icon(Icons.home),
        badgeContent: Text(
          '3',
          style: TextStyle(color: Colors.white),
        ),
      ),
      SideMenuItem(
        title: 'Users',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: Icon(Icons.person),
      ),
      SideMenuItem(
        title: 'Menu',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: Icon(Icons.menu),
      ),

      SideMenuItem(
        title: 'Exit',
        onTap: (index, _) {
sideMenu.changePage(index);
        },
        icon: Icon(Icons.exit_to_app),
      ),
    ];
    style: SideMenuStyle(
        displayMode: SideMenuDisplayMode.auto,
        decoration: BoxDecoration(),
        openSideMenuWidth: 200,
        compactSideMenuWidth: 40,
        hoverColor: Colors.blue[100],
        selectedColor: Colors.lightBlue,
        selectedIconColor: Colors.white,
        unselectedIconColor: Colors.black54,
        backgroundColor: Colors.grey,
        selectedTitleTextStyle: TextStyle(color: Colors.white),
        unselectedTitleTextStyle: TextStyle(color: Colors.black54),
        iconSize: 20,
        itemBorderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
        showTooltip: true,
        itemHeight: 50.0,
        itemInnerSpacing: 8.0,
        itemOuterPadding: const EdgeInsets.symmetric(horizontal: 5.0),
        toggleColor: Colors.black54
    );
    return
    Scaffold(
      body:

      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        SideMenu(
        // Page controller to manage a PageView
        controller: sideMenu,
        // Will shows on top of all items, it can be a logo or a Title text
        title: Container(
          height: h*0.3,
            width: w*0.2,

            child: Center(child: Image.asset(ImageConst.splashscreen,width: w*0.07,))),
    // Will show on bottom of SideMenu when displayMode was SideMenuDisplayMode.open
    footer: Text('Food App'),
    // Notify when display mode changed
    onDisplayModeChanged: (mode) {
    print(mode);
    },
    // List of SideMenuItem to show them on SideMenu
    items: items,
    ),
    Expanded(
    child:Container()
    ),
          SideMenuItem(
            builder: (context, displayMode) {
              return Container();
            },
            onTap: (index, sideMenuController) {

            },
          ),
    ],
      )
    );
  }
}
