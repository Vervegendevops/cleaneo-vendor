import 'package:cleaneo_vendor/Constant/signupVariables.dart';
import 'package:cleaneo_vendor/Screens/Vendor_Onboarding/uploadPAN.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class UploadAdhaar extends StatefulWidget {
  const UploadAdhaar({Key? key}) : super(key: key);

  @override
  State<UploadAdhaar> createState() => _UploadAdhaarState();
}

class _UploadAdhaarState extends State<UploadAdhaar> {
  TextEditingController aadharController = TextEditingController();
  XFile? _image1;
  XFile? _image2;
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
              padding: EdgeInsets.only(
                top: mQuery.size.height * 0.058,
                bottom: mQuery.size.height * 0.03,
                left: mQuery.size.width * 0.045,
                right: mQuery.size.width * 0.045,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
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
                    AppLocalizations.of(context)!.uploadadhaar,
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
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: mQuery.size.height * 0.028,
                    left: mQuery.size.width * 0.045,
                    right: mQuery.size.width * 0.045,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: mQuery.size.height * 0.032,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: mQuery.size.width * 0.9,
                            child: Text(
                              AppLocalizations.of(context)!.uploadadhaardesc,
                              style: const TextStyle(
                                  fontFamily: 'SatoshiMedium', fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mQuery.size.height * 0.03,
                      ),
                      buildImageContainer(
                          mQuery, _image1, 1), // First Image Container
                      SizedBox(
                        height: mQuery.size.height * 0.02,
                      ),
                      buildImageContainer(
                          mQuery, _image2, 2), // Second Image Container
                      const Expanded(child: SizedBox()),
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                print(aadhar1);
                                print(aadhar2);
                                if (aadhar1 != null && aadhar2 != null) {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const UploadPan();
                                  }));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Please fill in all the details'),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      margin: EdgeInsets.all(16.0),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                height: mQuery.size.height * 0.06,
                                decoration: BoxDecoration(
                                    color: const Color(0xff29b2fe),
                                    borderRadius: BorderRadius.circular(6)),
                                child: const Center(
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontFamily: 'SatoshiBold'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: mQuery.size.height * 0.02,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Note : Having trouble signing in?\n',
                              style:
                                  TextStyle(height: 1 / 4, color: Colors.grey),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Contact us at ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // ignore: deprecated_member_use
                                    launch("tel:+91 5678933738");
                                  },
                                  child: Text(
                                    '+91 5678933738',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors
                                            .blue), // Change color to indicate it's clickable
                                  ),
                                ),
                                Text(
                                  ' for help!',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: mQuery.size.height * 0.023,
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

  Widget buildImageContainer(
      MediaQueryData mQuery, XFile? imageFile, int index) {
    return GestureDetector(
      onTap: () async {
        final imageSource = await showModalBottomSheet<ImageSource>(
          backgroundColor: Colors.white,
          context: context,
          builder: (BuildContext context) {
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text(
                      'Camera',
                      style: TextStyle(
                        fontFamily: 'SatoshiMedium',
                      ),
                    ),
                    onTap: () => Navigator.of(context).pop(ImageSource.camera),
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text(
                      'Gallery',
                      style: TextStyle(
                        fontFamily: 'SatoshiMedium',
                      ),
                    ),
                    onTap: () => Navigator.of(context).pop(ImageSource.gallery),
                  ),
                ],
              ),
            );
          },
        );
        if (imageSource != null) {
          final XFile? pickedImage =
              await _imagePicker.pickImage(source: imageSource);

          setState(() {
            if (index == 1) {
              _image1 = pickedImage;
              aadhar1 = pickedImage;
            } else if (index == 2) {
              _image2 = pickedImage;
              aadhar2 = pickedImage;
            }
          });
        }
      },
      child: Container(
        width: double.infinity,
        height: mQuery.size.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: imageFile != null
              ? DecorationImage(
                  image: FileImage(File(imageFile.path)),
                  fit: BoxFit.cover,
                )
              : null, // Null if imageFile is null
        ),
        child: imageFile == null
            ? SvgPicture.asset(
                "assets/adhaarpicker.svg",
                height: mQuery.size.height * 0.2,
              )
            : null, // No child if imageFile is not null
      ),
    );
  }
}
