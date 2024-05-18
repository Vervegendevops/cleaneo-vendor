import 'dart:io';

import 'package:cleaneo_vendor/Home/CashCollected/Components/RowofTwoText.dart';
import 'package:cleaneo_vendor/Home/Drawer.dart';
import 'package:cleaneo_vendor/Home/Earnings/Components/RowofThreeText.dart';
import 'package:cleaneo_vendor/Home/BotNav.dart';
import 'package:cleaneo_vendor/Screens/Vendor_Onboarding/uploadAdhaar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class CashCollected extends StatefulWidget {
  const CashCollected({Key? key}) : super(key: key);

  @override
  State<CashCollected> createState() => _CashCollectedState();
}

class _CashCollectedState extends State<CashCollected> {
  TextEditingController storeNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController gstinController = TextEditingController();

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
                  Row(
                    children: [
                      const Text(
                        "Cash Collected",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: mQuery.size.width * 0.2,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.3,
                      blurRadius: 1,
                      offset: const Offset(
                          3, 3), // changes the position of the shadow
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(child: NavigationWithTabsTwoText())
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
