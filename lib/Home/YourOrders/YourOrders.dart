import 'dart:convert';
import 'dart:io';

import 'package:cleaneo_vendor/Constant/signupVariables.dart';
import 'package:cleaneo_vendor/Home/CashCollected/Components/RowofTwoText.dart';
import 'package:cleaneo_vendor/Home/Drawer.dart';
import 'package:cleaneo_vendor/Home/Earnings/Components/RowofThreeText.dart';
import 'package:cleaneo_vendor/Home/BotNav.dart';
import 'package:cleaneo_vendor/Home/OrderRequests/OrderReqDemoData.dart';
import 'package:cleaneo_vendor/Home/YourOrders/Components/Rowof2Text.dart';
import 'package:cleaneo_vendor/Screens/Vendor_Onboarding/uploadAdhaar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class YourOrders extends StatefulWidget {
  const YourOrders({Key? key}) : super(key: key);

  @override
  State<YourOrders> createState() => _YourOrdersState();
}

class _YourOrdersState extends State<YourOrders> {
  TextEditingController storeNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController gstinController = TextEditingController();
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map<String, dynamic>> orders = [
    {
      "status": "Accepted",
      "time": "11:30 AM",
    },
    {
      "status": "In Process",
      "time": "11:30 AM",
    },
    {
      "status": "On its way",
      "time": "11:30 AM",
    },
    {
      "status": "Delivered",
      "time": "11:30 AM",
    },
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchResponse();
    print(UserID);
  }

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
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
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: mQuery.size.width * 0.045,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Your Orders",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'SatoshiBold'),
                      ),
                    ],
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
                child: const Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(child: YourOrders2Text())
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
