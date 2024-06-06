import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/constans/image_const.dart';
import 'package:lottie/lottie.dart';

import '../../../main.dart';
import '../condroller/bookings_condroller.dart';

class Bookings extends ConsumerStatefulWidget {
  final String id;
  const Bookings(this.id, {super.key});

  @override
  ConsumerState<Bookings> createState() => _BookingsState();
}

class _BookingsState extends ConsumerState<Bookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("bookings"),
        ),
      ),
      body: Expanded(
        child:



        ref.watch(streambookings(widget.id)).when(data: (data){

         return data.isNotEmpty? SizedBox(
           // height: h*2,
           child: GridView.builder(itemCount: data.length,
           gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,crossAxisSpacing: w*0.01,mainAxisExtent: h*1.2),
           shrinkWrap: true,
                   physics: BouncingScrollPhysics(),
           itemBuilder: (context, index) {

           return Container(

                    width: w*0.6,

                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(w*0.02),

                    border: Border.all(color: Colors.black)),
                    child: Column(
                      children: [
           CircleAvatar(
             radius: w * 0.04,
             backgroundColor: Colors.redAccent,
             backgroundImage:
             NetworkImage(data[index].AllProducts[index]['ItemImage']),
           ),
           Padding(
             padding:  EdgeInsets.only(left:w*0.02,right: w*0.02,top: w*0.01),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   " Product Name : ",
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                 ),Text(
                    data[index].AllProducts[index]['ItemName'],
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                 ),
               ],
             ),
           ),
           Padding(
             padding:  EdgeInsets.only(left:w*0.02,right: w*0.02,top: w*0.01),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   " Price : ",
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                 ),Text(
                   data[index].AllProducts[index]['ItemPrice'].toString(),
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                 ),
               ],
             ),
           ),
           Padding(
             padding:  EdgeInsets.only(left:w*0.02,right: w*0.02,top: w*0.01),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   " Qty : ",
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                 ), Text(
                   data[index].AllProducts[index]["ItemQty"].toString(),
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                 ),
               ],
             ),
           ),
           Padding(
             padding:  EdgeInsets.only(left:w*0.02,right: w*0.02,top: w*0.01),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   " Buyer Name : ",
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                 ),
                 Text(
                   data[index].BName,
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                 ),
               ],
             ),
           ),
           Padding(
             padding:  EdgeInsets.only(left:w*0.02,right: w*0.02,top: w*0.01),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   " Buyer Area : ",
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                 ), Text(
                   data[index].BArea,
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                 ),
               ],
             ),
           ),
           Padding(
             padding:  EdgeInsets.only(left:w*0.02,right: w*0.02,top: w*0.01),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   " BuyerLandMark : ",
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                 ),Text(
                    data[index].BLandmark,
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                 ),
               ],
             ),
           ),
           Padding(
             padding:  EdgeInsets.only(left:w*0.02,right: w*0.02,top: w*0.01),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   " Buyer state : ",
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                 ),Text(
                   data[index].BState,
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                 ),
               ],
             ),
           ),
           Padding(
             padding:  EdgeInsets.only(left:w*0.02,right: w*0.02,top: w*0.01),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   " Buyer city : ",
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                 ),Text(
                    data[index].BTown,
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                 ),
               ],
             ),
           ),
           Padding(
             padding:  EdgeInsets.only(left:w*0.02,right: w*0.02,top: w*0.01),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   " Buyer PinCode :",
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                 ),Text(
                 data[index].BPincode.toString(),
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                 ),
               ],
             ),
           ),
           Padding(
             padding:  EdgeInsets.only(left:w*0.02,right: w*0.02,top: w*0.01),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   " Buyer PhoneNumber : ",
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                 ),Text(
                    data[index].BPhone.toString(),
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                 ),
               ],
             ),
           ),
            Padding(
              padding:  EdgeInsets.only(left:w*0.02,right: w*0.02,top: w*0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                   " Buyer Id : ",
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                             ),
                  Text(
                    data[index].BuyerId,
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                             ),
                ],
              ),
            ), Padding(
             padding:  EdgeInsets.only(left:w*0.02,right: w*0.02,top: w*0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                   " BookingId : ",
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                             ),Text(
                  data[index].BookingId,
                   style:
                   TextStyle(
                     fontSize:
                     w * 0.02,
                     fontWeight:
                     FontWeight
                         .w800,
                   ),
                             ),
                ],
              ),
            ),
                      ],
                    ),
           );


           }
           ),
         ):Center(
           child: Center(
             child: Lottie.asset(ImageConst.lottie,fit: BoxFit.fill),
           ),
         );

      },
      error: (error, stackTrace) => Center(child: Text(error.toString()),),   loading: () =>  Center(child: CircularProgressIndicator()),
         )



        )
      ) ;
  }
}
