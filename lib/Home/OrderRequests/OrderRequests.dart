import 'dart:convert';
import 'dart:io';
import 'package:cleaneo_vendor/Home/BotNav.dart';
import 'package:cleaneo_vendor/Home/OrderRequests/Components/orderSummary_bottom_modal.dart';
import 'package:cleaneo_vendor/Home/OrderRequests/OrderReqDemoData.dart';
import 'package:cleaneo_vendor/Home/OrderRequests/RejectOrder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

String datee = '';

class OrderReq extends StatefulWidget {
  const OrderReq({Key? key}) : super(key: key);

  @override
  State<OrderReq> createState() => _OrderReqState();
}

class _OrderReqState extends State<OrderReq> {
  Future<Object> fetchResponse() async {
    final url =
        'https://drycleaneo.com/CleaneoVendor/api/orderRequest/CleaneoVendor0001';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          print(response.body);
          OrderRequest = jsonDecode(response.body);
        });
        print(OrderRequest[0]['created_at']);
        return response.body == 'true';
      } else {
        // If the response status code is not 200, throw an exception or handle
        // the error accordingly.
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions if any occur during the request.
      print('Error fetching data: $e');
      return false; // Return false in case of an error.
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchResponse();
  }

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xff006acb),
        ),
        child: Column(
          children: [
            SizedBox(height: mQuery.size.height * 0.034),
            Padding(
              padding: const EdgeInsets.only(
                  top: 45, left: 16, right: 16, bottom: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const BotNav(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: mQuery.size.width * 0.045,
                  ),
                  Text(
                    AppLocalizations.of(context)!.orderrequest,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'SatoshiBold'),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                ),
                child: ListView.builder(
                  itemCount: OrderRequest
                      .length, // Replace dataList with your list of dynamic data

                  itemBuilder: (context, index) {
                    String created_at_str = OrderRequest[index]['created_at'];
                    String formatted_date = '';
                    // Convert the string to a DateTime object
                    DateTime created_at =
                        DateTime.parse(created_at_str).toLocal();

                    // Get the current DateTime
                    DateTime current_time = DateTime.now();

                    // Get yesterday's DateTime
                    DateTime yesterday =
                        current_time.subtract(Duration(days: 1));

                    // Check if the date is today
                    if (created_at.day == current_time.day &&
                        created_at.month == current_time.month &&
                        created_at.year == current_time.year) {
                      formatted_date =
                          "Today ${DateFormat("hh:mm a").format(created_at)}";

                      print(formatted_date);
                    }
                    // Check if the date is yesterday
                    else if (created_at.day == yesterday.day &&
                        created_at.month == yesterday.month &&
                        created_at.year == yesterday.year) {
                      formatted_date =
                          "Yesterday ${DateFormat("hh:mm a").format(created_at)}";
                      print(formatted_date);
                    }
                    // Display the full date if it's more than yesterday
                    else {
                      formatted_date =
                          DateFormat("dd'th' MMMM, yyyy").format(created_at);
                      print(formatted_date);
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 12.0,
                          ),
                          Row(
                            children: [
                              Text(
                                formatted_date,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 181, 181, 181),
                                    fontFamily: 'SatoshiMedium',
                                    fontSize: 12.0),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            width: mQuery.size.width * 0.9,
                            // height: mQuery.size.height * 0.28,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                            ),
                            // padding: EdgeInsets.all(mQuery.size.width * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                    ),
                                    color: Color(0xffe9f8ff),
                                  ),
                                  width: double.infinity,
                                  height: mQuery.size.height * 0.06,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: mQuery.size.width * 0.03),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: mQuery.size.width * 0.02,
                                      ),
                                      Text(
                                        'Order ID : ${OrderRequest[index]['OrderID']}',
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'SatoshiBold'),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      // Icon(
                                      //   Icons.star,
                                      //   size: mQuery.size.width * 0.047,
                                      //   color: const Color(0xff29b2fe),
                                      // ),
                                      // SizedBox(
                                      //   width: mQuery.size.width * 0.01,
                                      // ),
                                      // Text(
                                      //   data["rating"],
                                      //   style: const TextStyle(
                                      //       fontSize: 12,
                                      //       fontFamily: 'SatoshiBold'),
                                      // )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: mQuery.size.height * 0.01,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.loc,
                                        style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'SatoshiMedium',
                                            fontSize: 13),
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!.acceptin,
                                        style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'SatoshiMedium',
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: mQuery.size.width * 0.045,
                                        height: mQuery.size.height * 0.035,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff29b2fe)),
                                        child: Center(
                                          child: Icon(
                                            Icons.home,
                                            color: Colors.white,
                                            size: mQuery.size.width * 0.03,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: mQuery.size.width * 0.02,
                                      ),
                                      Text(
                                        '${OrderRequest[index]["Caddress"].substring(0, 25)}...',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'SatoshiBold'),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Text(
                                        OrderRequest[index]["PickupTime"],
                                        style: const TextStyle(
                                            color: Color(0xff29b2fe),
                                            fontSize: 12,
                                            fontFamily: 'SatoshiBold'),
                                      )
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Divider(
                                    color: Color.fromARGB(255, 212, 212, 212),
                                    thickness: 0.7,
                                  ),
                                ),
                                SizedBox(
                                  height: mQuery.size.height * 0.01,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        // width: mQuery.size.width * 0.38,
                                        // height: mQuery.size.height * 0.1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .pickdatetime,
                                              style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: 'SatoshiMedium',
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              height:
                                                  mQuery.size.height * 0.006,
                                            ),
                                            Text(
                                              OrderRequest[index]['PickupDate'],
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'SatoshiMedium'),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 45.0,
                                        width: 0.4,
                                        color: const Color.fromARGB(
                                            255, 195, 195, 195),
                                      ),
                                      Container(
                                        // width: mQuery.size.width * 0.38,
                                        // height: mQuery.size.height * 0.1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .deldatetime,
                                              style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: 'SatoshiMedium',
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              height:
                                                  mQuery.size.height * 0.006,
                                            ),
                                            Text(
                                              '${OrderRequest[index]['DeliveryDate']} | ${OrderRequest[index]['DeliveryTime']}',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'SatoshiMedium'),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: mQuery.size.height * 0.02,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Call the function to open the bottom-up modal
                                        orderSummary(
                                            context, OrderRequest[index]);
                                      },
                                      child: Container(
                                        width: mQuery.size.width * 0.9,
                                        height: mQuery.size.height * 0.045,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10)),
                                            color: Color(0xff29b2fe)),
                                        child: Center(
                                          child: Text(
                                            // AppLocalizations.of(context)!.acceptorder,
                                            "VIEW ORDER",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontFamily: 'SatoshiBold'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    /*GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RejectOrder()),
                                        );
                                      },
                                      child: Container(
                                        width: mQuery.size.width * 0.45,
                                        height: mQuery.size.height * 0.045,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(10)),
                                            color: Color(0xff29b2fe)),
                                        child: Center(
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .rejectorder,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ),*/
                                  ],
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
            )
          ],
        ),
      ),
    );
  }
}
