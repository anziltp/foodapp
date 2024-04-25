import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/constans/color_const.dart';
import 'package:foodapp/feature/admin_adding/controller/admin_controller.dart';
import 'package:foodapp/home_page.dart';
import 'package:foodapp/models/admin_model.dart';

import '../../../constans/snack_bar_page.dart';
import '../../../main.dart';

class AdminPage extends ConsumerStatefulWidget {
  const AdminPage({super.key});

  @override
  ConsumerState<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends ConsumerState<AdminPage> {
  String? dropdownvalue;
  String? chooseitem;
  String adminid="";
  var listItems = [
    "Admin",
    "Super Admin"
  ];
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  addingAdmin(){
    AdminModel Admins=AdminModel(
        email: email.text,
        password: password.text,
        role: dropdownvalue.toString(),
        id: "",

    );

    ref.watch(adminControllerProvider).admin(email: email.text, password: password.text, role: dropdownvalue.toString(), id: "");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(

        children: [
          Text("Add Admin",style: TextStyle(fontWeight: FontWeight.w800,fontSize: w*0.025),),
          SizedBox(height: h*0.03,),
          Padding(
            padding:  EdgeInsets.only(left: w*0.23),
            child: const Row(

              children: [

                Text("Email",style: TextStyle(fontWeight: FontWeight.w800),),
              ],
            ),
          ),
          SizedBox(height: h*0.01,),
          SizedBox(
            width: w*0.4,
            child: TextFormField(
                controller: email,
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                style: TextStyle(
                    fontSize: w * 0.015, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  filled: true,
                  labelText: "Please enter your email ",
                  labelStyle: TextStyle(
                      fontSize: w * 0.015, fontWeight: FontWeight.w500),
                  // hintText: "Please enter your name",
                  // hintStyle: TextStyle(
                  //   fontSize: w * 0.015,
                  //   fontWeight: FontWeight.w500,
                  // ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(w * 0.01)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(w * 0.01)),
                  fillColor: ColorConst.white
                )),
          ),
          SizedBox(height: h*0.05,),
          Padding(
            padding:  EdgeInsets.only(left: w*0.23),
            child: const Row(
              children: [
                Text("password",style: TextStyle(fontWeight: FontWeight.w800),),
              ],
            ),
          ),
          SizedBox(height: h*0.01,),
          SizedBox(
            width: w*0.4,
            child: TextFormField(
                controller: password,
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                style: TextStyle(
                    fontSize: w * 0.015, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  filled: true,
                  labelText: "Please enter your password",
                  labelStyle: TextStyle(
                      fontSize: w * 0.015, fontWeight: FontWeight.w500),
                  // hintText: "Please enter your name",
                  // hintStyle: TextStyle(
                  //   fontSize: w * 0.015,
                  //   fontWeight: FontWeight.w500,
                  // ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(w * 0.01)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(w * 0.01)),
                    fillColor: ColorConst.white
                )),
          ),
          SizedBox(height: h*0.04,),
          Padding(
            padding:  EdgeInsets.only(left: w*0.23),
            child: const Row(
              children: [

                Text("Role",style: TextStyle(fontWeight: FontWeight.w800),),
              ],
            ),
          ),
          SizedBox(height: h*0.01,),
          Container(
            width: w*0.4,
            height: w*0.04,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(w*0.01),
              border: Border.all(color: Colors.grey)
            ),
            child: DropdownButton(
              underline: const SizedBox(),
              hint: Padding(
                padding:  EdgeInsets.only(left: w*0.02,top: w*0.01),
                child: const Text("Selected Role "),
              ),
              icon: Padding(
                padding:  EdgeInsets.only(left: w*0.27,top: w*0.01),
                child: const Icon(Icons.arrow_drop_down_sharp),
              ),
            borderRadius: BorderRadius.circular(w*0.01),
              style: TextStyle(color: Colors.black, fontSize: w * 0.012),
              value: dropdownvalue,
              items: listItems.map((valueItem) {
                return DropdownMenuItem(
                    value: valueItem, child: Text(valueItem));
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  dropdownvalue = newValue;
                });
              },
            ),
          ),
          SizedBox(height: h*0.05,),
          InkWell(
            onTap: () {
              addingAdmin();
            },
            child: Container(
              height: h * 0.06,
              width: w * 0.2,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(
                    w * 0.04),
                gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomRight,
                    stops: [
                      0.3,
                      0.7
                    ],
                    colors: [
                      Color(0xffF9881F),
                      Color(0xffFF774C)
                    ]),
              ),
              child:  Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontWeight:
                        FontWeight.w800,fontSize: w*0.012,
                    color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
