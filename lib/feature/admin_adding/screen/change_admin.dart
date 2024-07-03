import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/models/admin_model.dart';

import '../../../constans/color_const.dart';
import '../../../constans/snack_bar_page.dart';
import '../../../main.dart';
import '../controller/admin_controller.dart';

class ChangeAdmin extends ConsumerStatefulWidget {
  const ChangeAdmin({super.key,required this.model});
  final AdminModel model;

  @override
  ConsumerState<ChangeAdmin> createState() => _ChangeAdminState();
}

class _ChangeAdminState extends ConsumerState<ChangeAdmin> {


  String? dropdownvalue;
  String? chooseitem;
  String adminid="";
  var listItems = [
    "Admin",
    "Super Admin"
  ];
  final formKey=GlobalKey<FormState>();
  final emailValidation=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final passwordValidation=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  adminUpdate() {

    AdminModel update = AdminModel(
      email: email.text,
      password: password.text,

      id:widget.model.id, role: dropdownvalue.toString(),
    );
    ref.read(adminControllerProvider).adminUpdate(update);
    showSnackBar(context, "Updating.....");
  }

  @override
  void initState() {
    email.text = widget.model.email;
    password.text = widget.model.password;
    dropdownvalue=widget.model.role;

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
      child: Form(
      key: formKey,
      child: Column(

        children: [

        Text("Update Admin",style: TextStyle(fontWeight: FontWeight.w800,fontSize: w*0.025),),
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
            validator: (value) {
              if(!emailValidation.hasMatch(value!)){
                return "enter valid email";

              }else{
                return null;
              }
            },
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
            validator: (value) {
              if(!passwordValidation.hasMatch(value!)){
                return "Password must contain \n1 capital(A-Z)\n1 small(a-z)\n1 Number(0-9)\n1 Special characterPassword must contain ";
              }else{
                return null;
              }
            },
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
          focusColor: Colors.white,

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

          adminUpdate();
          Navigator.pop(context);
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
                  ColorConst.Grey,
                  ColorConst.Grey2
                ]),
          ),
          child:  Center(
              child: Text(
                "Update",
                style: TextStyle(
                    fontWeight:
                    FontWeight.w800,fontSize: w*0.012,
                    color: Colors.black),
              )),
        ),
      ),
   ] )
    )));
  }
}
