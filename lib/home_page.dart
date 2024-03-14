import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
        title: 'Files',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: Icon(Icons.file_copy),
      ),
      SideMenuItem(
        title: 'downloade',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: Icon(Icons.download),
      ),
      SideMenuItem(
        title: 'Settings',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: Icon(Icons.settings),
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
        title: Image.network("https://play-lh.googleusercontent.com/_CpzRzAeTMMAooQFMnAtbVTQXs8Av41CFlVqwZ5zbvi-5G3vMsL5InfRgMdOY24SqQ",width: w*0.15,),
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
    child: PageView(
    controller: pageController,
    children: [
    Container(
    child: Center(
    child: Text('Dashboard'),
    ),
    ),
    Container(
    child: Center(
    child: Text('Settings'),
    ),
    ),Container(
    child: Center(
    child: Text('menu'),
    ),
    ),
    ],
    ),
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
