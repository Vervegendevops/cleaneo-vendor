import 'dart:io';

import 'package:cleaneo_vendor/Constant/signupVariables.dart';
import 'package:cleaneo_vendor/Home/BotNav.dart';
import 'package:cleaneo_vendor/Screens/Vendor_Onboarding/Verifying.dart';
import 'package:cleaneo_vendor/Screens/Vendor_Onboarding/takeSelfie.dart';
import 'package:cleaneo_vendor/end.dart';
import 'package:cleaneo_vendor/utils/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ConfirmLegal extends StatefulWidget {
  const ConfirmLegal({Key? key}) : super(key: key);

  @override
  State<ConfirmLegal> createState() => _ConfirmLegalState();
}

class _ConfirmLegalState extends State<ConfirmLegal> {
  bool isProcessing=false;
  Future<void> postData() async {
    print('good');
    const String apiUrl = 'https://drycleaneo.com/CleaneoVendor/api/signup';
    print(ALatitude);
    print(ALongitude);
    // Load image files

    List<File> imageFiles = [];

    // Add files from storePicture
    for (XFile? image in store_picture) {
      if (image != null) {
        imageFiles.add(File(image.path));
      }
    }

    //List<XFile> filteredStorePictures = store_picture.where((image) => image != null).cast<XFile>().toList();

    String imagePath = store_picture[0]!.path;
    File imageFile = File(imagePath);

    String imagePath2 = store_picture[1]!.path;
    File imageFile2 = File(imagePath2);

    String imagePath3 = store_picture[2]!.path;
    File imageFile3 = File(imagePath3);

    String imagePath4 = store_picture[3]!.path;
    File imageFile4 = File(imagePath4);






    String imagePath5 = store_document[0]!.path;
    File imageFile5 = File(imagePath5);

    String imagePath6 = store_document[1]!.path;
    File imageFile6 = File(imagePath6);

    String imagePath7 = store_document[2]!.path;
    File imageFile7 = File(imagePath7);

    String imagePath8 = store_document[3]!.path;
    File imageFile8 = File(imagePath8);

    String imagePath9 = aadhar1!.path;
    File imageFile9 = File(imagePath9);

    String imagePath10 = aadhar2!.path;
    File imageFile10 = File(imagePath10);

    String imagePath11 = pan!.path;
    File imageFile11 = File(imagePath11);

    String imagePath12 = selfieFinal!.path;
    File imageFile12 = File(imagePath12);

    // JSON data
    Map<String, String> jsonFields = {
      "ID": UserID,
      "name": name,
      "phone": phoneFinal,
      "email": email,
      "pan": panFinal,
      "store_name": storeName,
      "address": address,
      "gstin": gst,
      "selectedService": selectedServices.toString(),
      "pan": panFinal,
      "Latitude": ALatitude,
      "Longitude": ALongitude
    };

    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      // Add JSON fields
      request.fields.addAll(jsonFields);
      isProcessing=true;
      setState(() {

      });
      // Add image file
      // request.files.add(http.MultipartFile(
      //   'store_picture1',
      //   imageFile.readAsBytes().asStream(),
      //   imageFile.lengthSync(),
      //   filename: 'store_picture1.jpg',
      // ));
      //
      // request.files.add(http.MultipartFile(
      //   'store_picture2',
      //   imageFile2.readAsBytes().asStream(),
      //   imageFile2.lengthSync(),
      //   filename: 'store_picture2.jpg',
      // ));
      //
      // request.files.add(http.MultipartFile(
      //   'store_picture3',
      //   imageFile3.readAsBytes().asStream(),
      //   imageFile3.lengthSync(),
      //   filename: 'store_picture3.jpg',
      // ));
      //
      // request.files.add(http.MultipartFile(
      //   'store_picture4',
      //   imageFile4.readAsBytes().asStream(),
      //   imageFile4.lengthSync(),
      //   filename: 'store_picture4.jpg',
      // ));
      for (int i = 0; i < imageFiles.length; i++) {
        File imageFile = imageFiles[i];
        request.files.add(http.MultipartFile(
          'store_picture${i + 1}',
          imageFile.readAsBytes().asStream(),
          imageFile.lengthSync(),
          filename: 'store_picture${i + 1}.jpg',
        ));
      }

      request.files.add(http.MultipartFile(
        'store_document1',
        imageFile5.readAsBytes().asStream(),
        imageFile5.lengthSync(),
        filename: 'store_document1.jpg',
      ));


      request.files.add(http.MultipartFile(
        'store_document2',
        imageFile6.readAsBytes().asStream(),
        imageFile6.lengthSync(),
        filename: 'store_document2.jpg',
      ));

      request.files.add(http.MultipartFile(
        'store_document3',
        imageFile7.readAsBytes().asStream(),
        imageFile7.lengthSync(),
        filename: 'store_document3.jpg',
      ));

      request.files.add(http.MultipartFile(
        'store_document4',
        imageFile8.readAsBytes().asStream(),
        imageFile8.lengthSync(),
        filename: 'store_document4.jpg',
      ));

      request.files.add(http.MultipartFile(
        'aadhar1',
        imageFile9.readAsBytes().asStream(),
        imageFile9.lengthSync(),
        filename: 'aadhar1.jpg',
      ));

      request.files.add(http.MultipartFile(
        'aadhar2',
        imageFile10.readAsBytes().asStream(),
        imageFile10.lengthSync(),
        filename: 'aadhar2.jpg',
      ));

      request.files.add(http.MultipartFile(
        'panImage',
        imageFile11.readAsBytes().asStream(),
        imageFile11.lengthSync(),
        filename: 'panImage.jpg',
      ));

      request.files.add(http.MultipartFile(
        'selfie',
        imageFile12.readAsBytes().asStream(),
        imageFile12.lengthSync(),
        filename: 'selfie.jpg',
      ));
      print(request);
      var response = await request.send();

      if (response.statusCode == 200) {
        isProcessing=false;
        setState(() {

        });
        // Handle a successful response here
        var responseBody = await response.stream.bytesToString();
        print("Success: $responseBody");
        await LocalStorage.saveRegisteration("register");
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (_) => BotNav(
        //               indexx: 0,
        //             )));
        Fluttertoast.showToast(msg: "Your data is summitted successfully");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Verifying()));
      } else {
        isProcessing=false;
        setState(() {

        });
        // Handle errors or other status codes here
        Fluttertoast.showToast(msg: "something went wrong");
        print("Error: ${response.statusCode}");
        print("Response: ${await response.stream.bytesToString()}");
      }
    } catch (e) {
      isProcessing=false;
      setState(() {

      });
      print("Error: $e");
      // Handle network-related errors here
    }
  }

  TextEditingController storeNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController gstinController = TextEditingController();

  // T&C
  bool tandc0 = false;
  bool tandc1 = false;
  bool tandc2 = false;

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
                    AppLocalizations.of(context)!.legal,
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
                                AppLocalizations.of(context)!.legaldesc,
                                style: const TextStyle(
                                    fontSize: 16, fontFamily: 'SatoshiMedium'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mQuery.size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              'I agree to all the above terms of services',
                              style: TextStyle(fontFamily: 'SatoshiMedium'),
                            ),
                            Transform.scale(
                              scale: 0.7,
                              child: CupertinoSwitch(
                                value: tandc0,
                                onChanged: (bool value) {
                                  setState(() {
                                    tandc0 = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mQuery.size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: mQuery.size.width * 0.7,
                              child: const Text(
                                'I consent to electronic signatures and by checking this i agree to all the above terms of services.',
                                style: TextStyle(fontFamily: 'SatoshiMedium'),
                              ),
                            ),
                            Transform.scale(
                              scale: 0.7,
                              child: CupertinoSwitch(
                                value: tandc1,
                                onChanged: (bool value) {
                                  setState(() {
                                    tandc1 = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mQuery.size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: mQuery.size.width * 0.7,
                              child: const Text(
                                'I agree to receive promotional messages based on my location from Cleaneo via email and SMS until I unsubscribed.',
                                style: TextStyle(fontFamily: 'SatoshiMedium'),
                              ),
                            ),
                            Transform.scale(
                              scale: 0.7,
                              child: CupertinoSwitch(
                                value: tandc2,
                                onChanged: (bool value) {
                                  setState(() {
                                    tandc2 = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: GestureDetector(
                            onTap: (tandc0 == false ||
                                    tandc1 == false ||
                                    tandc2 == false)
                                ? null
                                : () {
                                    print(UserID);
                                    print(name);
                                    print(phoneFinal);
                                    print(email);
                                    print(storeName);
                                    print(address);
                                    print(gst);
                                    print(selectedServices);
                                    print(store_picture);
                                    print(store_document);

                                    print(selfieFinal);
                                    print(aadhar1);
                                    print(aadhar2);
                                    print(panFinal);
                                    print(pan);
                                    postData();
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (context) {
                                    //   return const Verifying();
                                    // }));
                                  },
                            child: Container(
                              width: double.infinity,
                              height: mQuery.size.height * 0.06,
                              decoration: BoxDecoration(
                                  color: (tandc0 == false ||
                                          tandc1 == false ||
                                          tandc2 == false)
                                      ? Color.fromARGB(150, 41, 179, 254)
                                      : const Color(0xff29b2fe),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Center(
                                child: isProcessing?CircularProgressIndicator(color: Colors.white,): Text(
                                  "Finish",
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
                                style: TextStyle(
                                    height: 1 / 4, color: Colors.grey),
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
