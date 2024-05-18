import 'dart:io';

import 'package:cleaneo_vendor/Home/BotNav.dart';
import 'package:cleaneo_vendor/Screens/Vendor_Onboarding/uploadAdhaar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class RejectOrder extends StatefulWidget {
  const RejectOrder({Key? key}) : super(key: key);

  @override
  State<RejectOrder> createState() => _RejectOrderState();
}

class _RejectOrderState extends State<RejectOrder> {
  TextEditingController storeNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController gstinController = TextEditingController();

  // Declare bool variables for each checkbox
  bool reason1 = false;
  bool reason2 = false;
  bool reason3 = false;
  bool reason4 = false;

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
                      Navigator.pop(context);
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
                    AppLocalizations.of(context)!.rejectorder,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
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
                child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: mQuery.size.width * 0.9,
                              child: Text(
                                AppLocalizations.of(context)!
                                    .provideRejectReason,
                                // textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mQuery.size.height * 0.032,
                        ),
                        //dist is too far
                        Container(
                            padding: const EdgeInsets.only(left: 16),
                            width: double.infinity,
                            height: mQuery.size.height * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(0,
                                      0), // changes the position of the shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Checkbox(
                                  activeColor: Colors.white,
                                  checkColor: const Color(0xff29b2fe),
                                  value: reason1,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      reason1 = value!;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.distanceTooFar,
                                  // textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ],
                            )),
                        //dp too far
                        SizedBox(
                          height: mQuery.size.height * 0.02,
                        ),
                        Container(
                            padding: const EdgeInsets.only(left: 16),
                            width: double.infinity,
                            height: mQuery.size.height * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(0,
                                      0), // changes the position of the shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Checkbox(
                                  activeColor: Colors.white,
                                  checkColor: Color(0xff29b2fe),
                                  value: reason2,
                                  onChanged: (value) {
                                    setState(() {
                                      reason2 = value!;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.notAvailable,
                                  // textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ],
                            )),
                        //others
                        SizedBox(
                          height: mQuery.size.height * 0.02,
                        ),
                        Container(
                            padding: const EdgeInsets.only(left: 16),
                            width: double.infinity,
                            height: mQuery.size.height * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(0,
                                      0), // changes the position of the shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Checkbox(
                                  activeColor: Colors.white,
                                  checkColor: Color(0xff29b2fe),
                                  value: reason3,
                                  onChanged: (value) {
                                    setState(() {
                                      reason3 = value!;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.notAvailable,
                                  // textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ],
                            )),
                        //others
                        SizedBox(
                          height: mQuery.size.height * 0.02,
                        ),
                        Container(
                            padding: const EdgeInsets.only(left: 16),
                            width: double.infinity,
                            height: mQuery.size.height * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(0,
                                      0), // changes the position of the shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Checkbox(
                                  activeColor: Colors.white,
                                  checkColor: Color(0xff29b2fe),
                                  value: reason4,
                                  onChanged: (value) {
                                    setState(() {
                                      reason4 = value!;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.notAvailable,
                                  // textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: mQuery.size.height * 0.03,
                        ),
                        Container(
                          height: 0.5,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: mQuery.size.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: mQuery.size.width * 0.9,
                              child: Text(
                                AppLocalizations.of(context)!.anyotherReason,
                                // textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mQuery.size.height * 0.02,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 16),
                          width: double.infinity,
                          height: mQuery.size.height * 0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(
                                    0, 0), // changes the position of the shadow
                              ),
                            ],
                          ),
                          child: TextField(
                            cursorColor: Colors.grey,
                            controller: storeNameController,
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText:
                                  AppLocalizations.of(context)!.writeReason,
                              hintStyle: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffABAFB1)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: mQuery.size.height * 0.04,
                        ),
                        GestureDetector(
                          onTap: () {
                            //SystemNavigator.pop();
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return const BotNav();
                            }));
                          },
                          child: Container(
                            width: double.infinity,
                            height: mQuery.size.height * 0.06,
                            decoration: BoxDecoration(
                                color: const Color(0xff29b2fe),
                                borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: GestureDetector(
                                child: const Text(
                                  "Submit",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: mQuery.size.height * 0.04,
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
