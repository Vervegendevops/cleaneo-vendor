import 'dart:io';

import 'package:cleaneo_vendor/Screens/Vendor_Onboarding/Verified.dart';
import 'package:cleaneo_vendor/Screens/Vendor_Onboarding/uploadAdhaar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class Verifying extends StatefulWidget {
  String? status;
   Verifying({Key? key,this.status}) : super(key: key);

  @override
  State<Verifying> createState() => _VerifyingState();
}

class _VerifyingState extends State<Verifying> {
  TextEditingController storeNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController gstinController = TextEditingController();

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
                    AppLocalizations.of(context)!.verifying,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'SatoshiBold'
                        ),
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
                    child: Column(
                      children: [
                        SizedBox(
                          height: mQuery.size.height * 0.032,
                        ),
                        Row(
                          children: [
                            Container(
                              width: mQuery.size.width * 0.9,
                              child: Text(
                                AppLocalizations.of(context)!.verifyingdesc,
                                style: const TextStyle(
                                  fontFamily: 'SatoshiMedium',
                                     fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                            width: mQuery.size.width * 0.6,
                            height: mQuery.size.height * 0.3,
                            child: SvgPicture.asset(
                              "assets/onboarding/verifying.svg",
                            )),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            //SystemNavigator.pop();
                            if(widget.status=="P"){
                              Fluttertoast.showToast(msg: "Please wait for Verification Process");
                            }
                            else{
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return const Verified();
                                  }));
                            }

                          },
                          child: Container(
                            width: double.infinity,
                            height: mQuery.size.height * 0.06,
                            decoration: BoxDecoration(
                                color: const Color(0xff29b2fe),
                                borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: const Text(
                                "Okay",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontFamily: 'SatoshiBold'),
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
