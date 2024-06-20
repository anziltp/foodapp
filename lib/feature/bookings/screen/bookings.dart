import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/constans/image_const.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../main.dart';
import '../condroller/bookings_condroller.dart';

class Bookings extends ConsumerStatefulWidget {
  final String id;
  const Bookings(this.id, {super.key});

  @override
  ConsumerState<Bookings> createState() => _BookingsState();
}

class _BookingsState extends ConsumerState<Bookings> {

  int activeIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("bookings"),
        ),
      ),
      body: ref.watch(streambookings(widget.id)).when(data: (data){

       return data.isNotEmpty? SizedBox(
         // height: h*2,
         child: GridView.builder(itemCount: data.length,
         gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,crossAxisSpacing: w*0.01,mainAxisExtent: h*1.2,mainAxisSpacing: w*0.01),
         shrinkWrap: true,
                 physics: const BouncingScrollPhysics(),
         itemBuilder: (context, index) {

           List a=data[index].AllProducts;
         return Container(

                  width: w*0.6,

                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(w*0.02),

                  border: Border.all(color: Colors.black)),
                  child: Column(
                    children: [
                      Container(
                        height: h*0.45,
                        width: w*0.6,
                        child: CarouselSlider.builder(

                          itemCount: a.length,
                            options: CarouselOptions(

                              enableInfiniteScroll: false,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                activeIndex=index;
                                print(index);
                                print(activeIndex);
                                setState(() {

                                });
                              },

                              height: h*0.45
                            ),
                            itemBuilder: (context, index, realIndex) {
                              return Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(top: w*0.02),
                                      child: CircleAvatar(
                                        radius: w * 0.04,
                                        backgroundColor: Colors.redAccent,
                                        backgroundImage:
                                        NetworkImage(a[index]['ItemImage']),
                                      ),
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
                                            a[index]['ItemName'],
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
                                            a[index]['ItemPrice'].toString(),
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
                                            a[index]["ItemQty"].toString(),
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
                            },
                        ),

                      ),
                      AnimatedSmoothIndicator(
                        activeIndex: activeIndex,
                        duration: Duration(
                            milliseconds: 200
                        ),
                        count: a.length,
                        effect:JumpingDotEffect(
                          activeDotColor: Colors.red
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
            error: (error, stackTrace) => Center(child: Text(error.toString()),),   loading: () =>  const Center(child: CircularProgressIndicator()),
       )
      ) ;
  }
}
