import 'package:cleaneo_vendor/Screens/Vendor_Onboarding/Address/selectLocation.dart';
import 'package:cleaneo_vendor/Screens/Vendor_Onboarding/storePics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Constant/signupVariables.dart';

class StoreDetailsPage extends StatefulWidget {
  const StoreDetailsPage({Key? key}) : super(key: key);

  @override
  State<StoreDetailsPage> createState() => _StoreDetailsPageState();
}

class _StoreDetailsPageState extends State<StoreDetailsPage> {
  TextEditingController storeNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController gstinController = TextEditingController();
  Future<void> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    print("permision :  $permission");
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SearchLocationScreen();
      })).then((value) => setState(() {}));
    } else if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied ||
        permission == LocationPermission.unableToDetermine) {
      print('denied');
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SearchLocationScreen();
        })).then((value) => setState(() {}));
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                    AppLocalizations.of(context)!.addstore,
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: mQuery.size.height * 0.032,
                        ),
                        Text(
                          AppLocalizations.of(context)!.basicinfo,
                          style: const TextStyle(
                              fontFamily: 'SatoshiBold', fontSize: 15),
                        ),
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
                                offset: const Offset(
                                    0, 0), // changes the position of the shadow
                              ),
                            ],
                          ),
                          child: TextField(
                            onSubmitted: (value) {
                              setState(() {
                                storeName = value;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                storeName = value;
                              });
                            },
                            cursorColor: Colors.grey,
                            controller: storeNameController,
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 16),
                              hintText: "Name of the Store",
                              hintStyle: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'SatoshiMedium',
                                  color: Color(0xffABAFB1)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: mQuery.size.height * 0.033,
                        ),
                        GestureDetector(
                          onTap: () {
                            checkLocationPermission();
                          },
                          child: Container(
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
                            child: TextField(
                              enabled: false,
                              onChanged: (value) {
                                setState(() {
                                  address = value;
                                });
                              },
                              onSubmitted: (value) {
                                setState(() {
                                  address = value;
                                });
                              },
                              cursorColor: Colors.grey,
                              controller: addressController,
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 16),
                                hintText: Caddress == ''
                                    ? 'Enter your address'
                                    : Caddress,
                                hintStyle: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'SatoshiMedium',
                                    color: Color(0xffABAFB1)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: mQuery.size.height * 0.033,
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
                                offset: const Offset(
                                    0, 0), // changes the position of the shadow
                              ),
                            ],
                          ),
                          child: TextField(
                            onSubmitted: (value) {
                              setState(() {
                                gst = value;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                gst = value;
                              });
                            },
                            cursorColor: Colors.grey,
                            controller: gstinController,
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 16),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: "GSTIN",
                              hintStyle: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'SatoshiMedium',
                                  color: Color(0xffABAFB1)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: mQuery.size.height * 0.04,
                        ),
                        Text(
                          AppLocalizations.of(context)!.selecttheservices,
                          style: const TextStyle(
                              fontSize: 15, fontFamily: 'SatoshiBold'),
                        ),
                        SizedBox(
                          height: mQuery.size.height * 0.023,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                toggleServiceSelection("Wash");
                              },
                              child: buildServiceContainer(
                                "assets/images/Wash.png",
                                "Wash",
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                toggleServiceSelection("Wash & Iron");
                              },
                              child: buildServiceContainer(
                                "assets/images/Wash & Iron.png",
                                "Wash & Iron",
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                toggleServiceSelection("Stream Iron");
                              },
                              child: buildServiceContainer(
                                "assets/images/Steam Iron.png",
                                "Stream Iron",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mQuery.size.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                toggleServiceSelection("Dry Clean");
                              },
                              child: buildServiceContainer(
                                "assets/images/Dry Clean.png",
                                "Dry Clean",
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                toggleServiceSelection("Premium Wash");
                              },
                              child: buildServiceContainer(
                                "assets/images/Premium Wash.png",
                                "Premium Wash",
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                toggleServiceSelection("Shoe & Bag Care");
                              },
                              child: buildServiceContainer(
                                "assets/images/Shoe & Bag Care.png",
                                "Shoe & Bag Care",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mQuery.size.height * 0.05,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("storeName=$storeName");
                            print("address=$address");
                            print("gst=$gst");
                            print("selectedServices=$selectedServices");
                            if (storeName.isEmpty ||
                                address.isEmpty ||
                                gst.isEmpty ||
                                selectedServices.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('Please fill in all the details'),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  margin: EdgeInsets.all(16.0),
                                ),
                              );
                            } else {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return StorePics();
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
                                "Next",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontFamily: 'SatoshiBold'),
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
                          height: mQuery.size.height * 0.023,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildServiceContainer(String imagePath, String serviceName) {
    var mQuery = MediaQuery.of(context);
    bool isSelected = selectedServices.contains(serviceName);
    print(selectedServices);
    return Stack(
      children: [
        Container(
          height: mQuery.size.height * 0.11,
          width: mQuery.size.width * 0.27,
          decoration: BoxDecoration(
            color: selectedServices.contains(serviceName)
                ? const Color(0xfff3fbff) // Change the color if selected
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset:
                    const Offset(0, 0), // changes the position of the shadow
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                height: mQuery.size.height * 0.038,
              ),
              Container(
                height: mQuery.size.height * 0.04,
                width: mQuery.size.width * 0.09,
                child: Image.asset(
                  imagePath,
                  width: 32,
                ),
              ),
              Text(
                serviceName,
                style: const TextStyle(
                  fontFamily: 'SatoshiMedium',
                  fontSize: 11,
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: mQuery.size.width * 0.025,
          top: mQuery.size.height * 0.006,
          child: Container(
            height: mQuery.size.height * 0.03,
            width: mQuery.size.width * 0.05,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.blue : Colors.transparent,
              border: Border.all(
                color: isSelected ? Colors.transparent : Colors.grey,
              ),
            ),
            child: isSelected
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 14,
                  )
                : null,
          ),
        ),
      ],
    );
  }

  void toggleServiceSelection(String serviceName) {
    setState(() {
      if (selectedServices.contains(serviceName)) {
        selectedServices.remove(serviceName);
      } else {
        selectedServices.add(serviceName);
      }
    });
  }
}
