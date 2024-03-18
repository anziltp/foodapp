// class onBodyContent{
//   String image;
//   String text;
//   onBodyContent({required this.image,required this.text});
// }
// List<onBodyContent>contents=[
//   onBodyContent(image:( "assets/images/firstpageimage.png"),
//       text: "Order from your favourite\nstores or vendors"),
//       onBodyContent(image: ("assets/images/firstpageimage2.png"), text: "Choose from a wide range of \n delicious meals"),
//   onBodyContent(image: ("assets/images/firstpageimage3.png"), text: "Enjoy instant delivery \nand payment")
// ];
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:foodapp/constans/image_const.dart';


import 'package:foodapp/login%20part/create_account.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidebarx/sidebarx.dart';

import 'constans/color_const.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController name = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController email = TextEditingController();
class _HomePageState extends State<HomePage> {
  final _controller = SideMenuController();
  int _currentIndex = 0;
  List<Widget> views = const [
    Center(
      child: Text('Dashboard'),
    ),
    Center(
      child: Text('Account'),
    ),
    Center(
      child: Text('Settings'),
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,

      ),
body: Row(
  children: [
    SideMenu(
      controller: _controller,
      backgroundColor: Colors.white,
priority: SideMenuPriority.sizer,
      mode: SideMenuMode.open,
      builder: (data) {
        return SideMenuData(
          header: Container(
            height: h*0.2,
              child: Image.asset(ImageConst.splashscreen,width: w*0.07,)),
          items: [

            SideMenuItemDataTile(
              isSelected: _currentIndex == 0,
              onTap: () => setState(() => _currentIndex = 0),
              title: ' Dashboard',
              hoverColor: Colors.blueGrey,
              selectedTitleStyle:
              const TextStyle(fontWeight: FontWeight.w700,color: Colors.black),
              titleStyle: const TextStyle(color: Colors.black),
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home),

            ),

            SideMenuItemDataTile(
              isSelected: _currentIndex == 1,
              onTap: () => setState(() => _currentIndex = 1),
              title: 'Users',
              hoverColor: Colors.blueGrey,
              selectedTitleStyle:
              const TextStyle(fontWeight: FontWeight.w700,color: Colors.black),
              icon: const Icon(Icons.person),
              selectedIcon: const Icon(Icons.person),
              titleStyle: const TextStyle(color: Colors.black),
            ),

            SideMenuItemDataTile(
              isSelected: _currentIndex == 2,
              onTap: () => setState(() => _currentIndex = 2),
              title: 'settings',
              hoverColor: Colors.blueGrey,
              selectedTitleStyle:
              const TextStyle(fontWeight: FontWeight.w700,color: Colors.black),
              icon: const Icon(Icons.settings),
              selectedIcon: const Icon(Icons.settings),
              titleStyle: const TextStyle(color: Colors.black),
            ),

          ],
          footer: InkWell(
            onTap: () {
              showCupertinoModalPopup(context: context, builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text("Are you sure\nYou want to Exit"),
                  actions: [
                    Column(
                      children: [
                        CupertinoDialogAction(child: Text("yes",style: GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w800,color: Colors.red),)),
                        const Divider(),
                        CupertinoDialogAction(child: Text("cancel",style: GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w800),)
                          ,onPressed: () {
                            Navigator.pop(context);
                          },),

                      ],
                    )
                  ],
                );
              },);
            },
            child: Container(
              height: h*0.07,
              width: w*0.2,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.white,
              ),

              child: Padding(
                padding:  EdgeInsets.only(left:w*0.04),
                child: Row(

                  children: [
                    Text('EXIT',style: TextStyle(
                      fontWeight: FontWeight.w700,fontSize: w*0.02
                    ),),
                    SizedBox(width: w*0.02,),
                    const Icon(Icons.exit_to_app,)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
    Expanded(
      flex: 3,
      child:  views.elementAt(_currentIndex),
    ),

  ],
),


    );

  }
}
