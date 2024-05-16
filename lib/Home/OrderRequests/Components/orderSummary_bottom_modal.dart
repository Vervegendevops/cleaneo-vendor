import 'dart:convert';

import 'package:cleaneo_vendor/Home/OrderStatus/OrderStatus.dart';
import 'package:cleaneo_vendor/Screens/Welcome/Components/termsService.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

void orderSummary(context, Map<String, dynamic> data) {
  var shirtsNo1 = 01;
  var blouseNo = 03;
  var lehengaNo = 01;
  var evDressNo = 01;
  var nightSuiteNo = 02;
  var waistSuitNo = 02;
  var shortNo = 02;
  var skirtNo = 02;
  var sCNo = 01;
  var inWearNo = 06;
  var socksNo = 01;
  var frockNo = 02;
  var jumpSuitNo = 02;

  var kurtaDesignerNo = 02;
  var bedSheetNo = 01;
  var batheMateNo = 01;

  var shirtPrice1 = 10.0;
  var blousePrice = 30.0;
  var lehengaPrice = 180.0;
  var evPrice = 190.0;
  var nightSuitPrice = 45.0;
  var waistCoatPrice = 50.0;
  var shortPrice = 25.0;
  var skirtPrice = 25.0;
  var sCPrice = 30.0;
  var inWearPrice = 15.0;
  var socksPrice = 10.0;
  var frockPrice = 35.0;
  var jumpSuitePrice = 50.0;
  var kurtaDesignerPrice = 30.0;
  var bedSheetPrice = 50.0;
  var bathMatePrice = 30.0;

  double totalShirtPrice1 = shirtsNo1 * shirtPrice1;
  double totalBlousePrice = blouseNo * blousePrice;
  double totalLehengaPrice = lehengaNo * lehengaPrice;
  double totalEvPrice = evDressNo * evPrice;
  double totalNighSuitPrice = nightSuiteNo * nightSuitPrice;
  double totalWaistCoastPrice = waistSuitNo * waistCoatPrice;
  double totalShortPrice = shortNo * shortPrice;
  double totalSkirtPrice = skirtNo * skirtPrice;
  double totalScPrice = sCNo * sCPrice;
  double totalinWearPrice = inWearNo * inWearPrice;
  double totalSocksPrice = socksNo * socksPrice;
  double totalfrockPrice = frockNo * frockPrice;
  double totalJumpSuitPrice = jumpSuitNo * jumpSuitePrice;

  double totalKurtaDesignerPrice = kurtaDesignerNo * kurtaDesignerPrice;
  double totalBedSheetPrice = bedSheetNo * bedSheetPrice;
  double totalBathMatePrice = batheMateNo * bathMatePrice;

  Map<String, double> prices = {
    "Item Total": 1640,
    "Delivery Charges": 50,
    "Tax": 60,
  };

  double calculateTotal(Map<String, double> prices) {
    double total = 0;
    prices.forEach((key, value) {
      total += value;
    });
    return total;
  }

  var userName = "Shweta";
  var distance = 1.2;

  // var MediaQuery.of(context) = MediaQuery.of(context);
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      String totalSum = '₹ ${calculateTotal(prices).toStringAsFixed(2)}';
      return Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              )),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 24.0, top: 18.0),
                      child: Row(
                        children: [
                          Text(
                            "Pickup Order Summary",
                            style: TextStyle(
                              fontFamily: 'SatoshiBold',
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: const Color(0xffebf7ed),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          )),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.08,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.04),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.016,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Order ID :${data['OrderID']}',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.018,
                                        fontFamily: 'SatoshiBold'),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.36,
                                  ),
                                  // Row(children: [
                                  //   Container(
                                  //     width: MediaQuery.of(context).size.width * 0.05,
                                  //     height: MediaQuery.of(context).size.height * 0.04,
                                  //     decoration: const BoxDecoration(
                                  //         shape: BoxShape.circle,
                                  //         color: Color(0xff29b2fe)),
                                  //     child: Center(
                                  //       child: Icon(
                                  //         Icons.home,
                                  //         color: Colors.white,
                                  //         size: MediaQuery.of(context).size.width * 0.033,
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   SizedBox(
                                  //     width: MediaQuery.of(context).size.width * 0.02,
                                  //   ),
                                  //   // Text(
                                  //   //   "$distance km",
                                  //   //   style: TextStyle(
                                  //   //       fontSize: MediaQuery.of(context).size.height * 0.018,
                                  //   //       fontFamily: 'SatoshiBold'),
                                  //   // ),
                                  // ])
                                ],
                              ),
                              Text(
                                data['Caddress'],
                                style: TextStyle(
                                    fontSize: 10, fontFamily: 'SatoshiMedium'),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.03,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      color: const Color(0xfff8f8f8),
                      child: Row(
                        children: [
                          const Expanded(child: SizedBox()),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.06,
                          ),
                        ],
                      ),
                    ),
                    products(
                      data: data['VendorItems'],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(); // Replace YourBottomSheetWidget with your actual widget
                        },
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.08,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          color: const Color(0xff29b2fe),
                          borderRadius: BorderRadius.circular(6)),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.012),
                              Text(
                                "TOTAL",
                                style: TextStyle(
                                    fontFamily: 'SatoshiMedium',
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                    color: Colors.white),
                              ),
                              Text(
                                data['VendorTotalCost'],
                                style: TextStyle(
                                  fontFamily: 'SatoshiMedium',
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                              )
                            ],
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            "Change Status",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.024,
                                fontFamily: 'SatoshiMedium'),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02),
                          const Icon(Icons.arrow_right, color: Colors.white)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  )
                ],
              ),
            ],
          ));
    },
  );
}

void _showMessage(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      var mque = MediaQuery.of(context);
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Center(
            child: Text(
          'Congratulations',
          style: TextStyle(fontSize: 17, fontFamily: 'SatoshiBold'),
        )),
        content: const Text(
          'The order has been successfully picked',
          style: TextStyle(fontFamily: 'SatoshiMedium', fontSize: 12),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => OrderStatus()),
              );
            },
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                  color: const Color(0xff29b2fe),
                  borderRadius: BorderRadius.circular(6)),
              child: Center(
                child: Text(
                  "Go to Order Status",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SatoshiBold',
                      fontSize: MediaQuery.of(context).size.height * 0.023),
                ),
              ),
            ),
          )
        ],
      );
    },
  );
}

class products extends StatefulWidget {
  String data;
  products({super.key, required this.data});
  @override
  State<products> createState() => _productsState();
}

class _productsState extends State<products> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> jsonData = jsonDecode(jsonDecode(widget.data));
    print(jsonData);
    return Container(
      height: 450,
      child: ListView.separated(
        itemCount: jsonData.length,
        separatorBuilder: (BuildContext context, int index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(),
        ),
        itemBuilder: (BuildContext context, int index) {
          int TotalPrice = (jsonData[index]['quantity']) *
              int.parse(jsonData[index]['price']);
          print(TotalPrice);
          return Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "${jsonData[index]['quantity']} x ${jsonData[index]['name']} (${jsonData[index]['type']})",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.017,
                          fontFamily: 'SatoshiMedium',
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.003),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.02),
                    child: Row(
                      children: [
                        Text(
                          "₹ ${jsonData[index]['price']}  PER PIECE",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.017,
                            fontFamily: 'SatoshiMedium',
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          "₹ $TotalPrice",
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.017,
                            fontFamily: 'SatoshiMedium',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.016),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
