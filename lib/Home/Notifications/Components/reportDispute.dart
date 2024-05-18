import 'dart:io';

import 'package:cleaneo_vendor/Home/BotNav.dart';
import 'package:cleaneo_vendor/Screens/Vendor_Onboarding/uploadAdhaar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ReportDispute extends StatefulWidget {
  const ReportDispute({Key? key}) : super(key: key);

  @override
  State<ReportDispute> createState() => _ReportDisputeState();
}

class _ReportDisputeState extends State<ReportDispute> {
  TextEditingController storeNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController gstinController = TextEditingController();
  bool _reason1 = false;
  bool _reason2 = false;
  bool _reason3 = false;
  bool _reason4 = false;
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
                    AppLocalizations.of(context)!.reportdispute,
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
                                    .checkedandcollected,
                                // textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: 'SatoshiBold',
                                    fontSize: 15,
                                    color: Color(0xff29b2fe)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mQuery.size.height * 0.02,
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
                                  spreadRadius: 0,
                                  blurRadius: 7,
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
                                  value: _reason1,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _reason1 = value!;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .quantitymismatch,
                                  // textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: 'SatoshiMedium'
                                     ),
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
                                  spreadRadius: 0,
                                  blurRadius: 7,
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
                                  value: _reason2,
                                  onChanged: (value) {
                                    setState(() {
                                      _reason2 = value!;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.stains,
                                  // textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontFamily: 'SatoshiMedium'
                                  ),
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
                                  spreadRadius: 0,
                                  blurRadius: 7,
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
                                  value: _reason3,
                                  onChanged: (value) {
                                    setState(() {
                                      _reason3 = value!;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.typeofcloth,
                                  // textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontFamily: 'SatoshiMedium'
                                  ),
                                ),
                              ],
                            )),
                        //others

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
                                AppLocalizations.of(context)!.anyotherdispute,
                                // textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: 'SatoshiBold',
                                fontSize: 15),
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
                          height: mQuery.size.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 7,
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
                                  fontFamily: 'SatoshiMedium',
                                  color: Color(0xffABAFB1)),
                            ),
                          ),
                        ),
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
                                AppLocalizations.of(context)!.uploadpics,
                                // textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: 'SatoshiBold',
                                fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mQuery.size.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.asset(
                              "assets/imagepicker.svg",
                              height: mQuery.size.height * 0.07,
                              width: mQuery.size.width * 0.07,
                            ),
                            SvgPicture.asset(
                              "assets/imagepicker.svg",
                              height: mQuery.size.height * 0.07,
                              width: mQuery.size.width * 0.07,
                            ),
                            SvgPicture.asset(
                              "assets/imagepicker.svg",
                              height: mQuery.size.height * 0.07,
                              width: mQuery.size.width * 0.07,
                            ),
                            SvgPicture.asset(
                              "assets/imagepicker.svg",
                              height: mQuery.size.height * 0.07,
                              width: mQuery.size.width * 0.07,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
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
                                      fontFamily: 'SatoshiBold'),
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
