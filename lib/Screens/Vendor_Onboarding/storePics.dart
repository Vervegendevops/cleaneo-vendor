import 'dart:io';

import 'package:cleaneo_vendor/Constant/signupVariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'RegistrationStarting.dart';

class StorePics extends StatefulWidget {
  const StorePics({Key? key}) : super(key: key);

  @override
  State<StorePics> createState() => _StorePicsState();
}

class _StorePicsState extends State<StorePics> {
  List<XFile?> _storeImages = List.filled(4, null);
  List<XFile?> _documentImages = List.filled(4, null);
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickStoreImage(int index) async {
    final imageSource = await showModalBottomSheet<ImageSource>(
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
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

      if (pickedImage != null) {
        setState(() {
          _storeImages[index] = pickedImage;
          store_picture[index] = pickedImage;
        });
      }
    }
  }

  Future<void> _pickDocumentImage(int index) async {
    final imageSource = await showModalBottomSheet<ImageSource>(
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
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

      if (pickedImage != null) {
        setState(() {
          _documentImages[index] = pickedImage;
          store_document[index] = pickedImage;
        });
      }
    }
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
                    AppLocalizations.of(context)!.uploadstorepics,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'SatoshiBold',
                      color: Colors.white,
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
                          Text(
                            AppLocalizations.of(context)!.uploadstorepics,
                            style: const TextStyle(
                                fontSize: 15, fontFamily: 'SatoshiBold'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mQuery.size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          4,
                          (index) => GestureDetector(
                            onTap: () => _pickStoreImage(index),
                            child: _storeImages[index] != null
                                ? Image.file(
                                    File(_storeImages[index]!.path),
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  )
                                : SvgPicture.asset(
                                    "assets/imagepicker.svg",
                                    width: 70,
                                    height: 70,
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mQuery.size.height * 0.032,
                      ),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.uploadstoredocs,
                            style: const TextStyle(
                              fontFamily: 'SatoshiBold',
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mQuery.size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          4,
                          (index) => GestureDetector(
                            onTap: () => _pickDocumentImage(index),
                            child: _documentImages[index] != null
                                ? Image.file(
                                    File(_documentImages[index]!.path),
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  )
                                : SvgPicture.asset(
                                    "assets/imagepicker.svg",
                                    width: 70,
                                    height: 70,
                                  ),
                          ),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          if (store_picture.length > 2 &&
                              store_document.length > 2) {
                            print(store_picture);
                            print(store_document);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RegStart();
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
