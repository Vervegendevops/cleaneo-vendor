import 'package:cleaneo_vendor/Screens/Vendor_Onboarding/uploadAdhaar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cleaneo_vendor/Constant/signupVariables.dart';

class TakeSelfie extends StatefulWidget {
  const TakeSelfie({Key? key}) : super(key: key);

  @override
  State<TakeSelfie> createState() => _TakeSelfieState();
}

class _TakeSelfieState extends State<TakeSelfie> {
  XFile? _selfie;
  final ImagePicker _imagePicker = ImagePicker();

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
                top: 45,
                left: 16,
                right: 16,
                bottom: 20,
              ),
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
                    AppLocalizations.of(context)!.takeselfie,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'SatoshiBold',
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
                    topRight: Radius.circular(16),
                  ),
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
                              AppLocalizations.of(context)!.takeselfiedesc,
                              style: const TextStyle(
                                fontFamily: 'SatoshiMedium',
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        width: mQuery.size.width * 0.6,
                        height: mQuery.size.height * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: _selfie != null
                              ? DecorationImage(
                                  image: FileImage(File(_selfie!.path)),
                                  fit: BoxFit.cover,
                                )
                              : null, // Null if _selfie is null
                        ),
                        child: _selfie == null
                            ? Container(
                                width: mQuery.size.width * 0.6,
                                height: mQuery.size.height * 0.3,
                                child: SvgPicture.asset(
                                  "assets/onboarding/selfie.svg",
                                ),
                              )
                            : null, // No child if _selfie is not null
                      ),
                      const Spacer(),
                      _selfie != null
                          ? GestureDetector(
                              onTap: () {
                                print(selfieFinal);
                                if (selfieFinal != null) {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return UploadAdhaar();
                                  }));
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                height: mQuery.size.height * 0.06,
                                decoration: BoxDecoration(
                                  color: const Color(0xff29b2fe),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: const Text(
                                    "Next",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontFamily: 'SatoshiBold',
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () async {
                                XFile? pickedImage = await _imagePicker
                                    .pickImage(source: ImageSource.camera);

                                setState(() {
                                  _selfie = pickedImage;
                                  selfieFinal = pickedImage;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                height: mQuery.size.height * 0.06,
                                decoration: BoxDecoration(
                                  color: const Color(0xff29b2fe),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: const Text(
                                    "Take a Selfie",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontFamily: 'SatoshiBold',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: mQuery.size.height * 0.04,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
