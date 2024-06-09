import 'dart:convert';

import 'package:cleaneo_vendor/Home/OrderRequests/Components/tracker.dart';
import 'package:cleaneo_vendor/Home/OrderRequests/OrderReqDemoData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:order_tracker/order_tracker.dart';

int changeStatusCount = 0;
Future<void> _triggerApiCall() async {
  final String apiUrl =
      'https://drycleaneo.com/CleaneoVendor/api/updateOrderStatus/000000122';

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
    );

    if (response.statusCode == 200) {
      // Successful API call
      changeStatusCount = jsonDecode(response.body).length;
      print(changeStatusCount);
      print('API call successful');
    } else {
      // API call failed
      print('Failed with status code: ${response.statusCode}');
    }
  } catch (e) {
    // Exception occurred
    print('Exception: $e');
  }
}

class ChangeStatusSheet extends StatefulWidget {
  int statusCount;
  ChangeStatusSheet({super.key, required this.statusCount});

  @override
  State<ChangeStatusSheet> createState() => _ChangeStatusSheetState();
}

Map<String, String> demoMap = {
  'status': 'p',
  'time': '23-oct-2023',
  'xyz': '23-oct-2023',
};

int mapLength = demoMap.length;

class _ChangeStatusSheetState extends State<ChangeStatusSheet> {
  List<TextDtoo> orderList = [
    TextDtoo("Order has reached to you", ''),
    // TextDtoo("Seller ha processed your order", "Sun, 27th Mar '22 - 10:19am"),
    // TextDtoo("Your item has been picked up by courier partner.",
    // "Tue, 29th Mar '22 - 5:00pm"),
  ];

  List<TextDtoo> shippedList = [
    TextDtoo("Order is being processed", ""),
    // TextDtoo("Your item has been received in the nearest hub to you.", null),
  ];

  List<TextDtoo> outOfDeliveryList = [
    TextDtoo("Order is Packed and Ready to deliver", ""),
  ];

  List<TextDtoo> deliveredList = [
    TextDtoo("Order picked up by Delivery Agent", ""),
  ];
  @override
  Widget build(BuildContext context) {
    print(widget.statusCount);
    return Container(
      // Statuss { order, shipped, outOfDelivery, delivered }
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Tracker(
              status: widget.statusCount == 3
                  ? Statuss.order
                  : widget.statusCount == 4
                      ? Statuss.shipped
                      : widget.statusCount == 5
                          ? Statuss.outOfDelivery
                          : Statuss.delivered,
              activeColor: Colors.green,
              inActiveColor: Colors.grey[300],
              orderTitleAndDateList: orderList,
              shippedTitleAndDateList: shippedList,
              outOfDeliveryTitleAndDateList: outOfDeliveryList,
              deliveredTitleAndDateList: deliveredList,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    color: Color(0xff29b2fe),
                    borderRadius: BorderRadius.circular(6)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Update Status",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          color: Colors.white,
                          fontFamily: 'SatoshiBold',
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class status1 extends StatefulWidget {
  const status1({super.key});

  @override
  State<status1> createState() => _status1State();
}

class _status1State extends State<status1> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.check_circle,
          size: 30,
          color: Colors.blue,
        ),
        SizedBox(
          width: 16.0,
        ),
        Text(
          "Order Taken",
          style: TextStyle(
            fontFamily: 'SatoshiMedium',
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }
}
