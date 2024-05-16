import 'dart:convert';

import 'package:cleaneo_vendor/Screens/Auth/Login.dart';
import 'package:cleaneo_vendor/Screens/Auth/Signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import '../../Constant/signupVariables.dart';

String termsAndConditions = '';
String privacy = '';
String contentPolicy = '';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Future<bool> fetchTermsAndConditions() async {
    const url0 =
        'https://drycleaneo.com/CleaneoUser/api/termscondition/terms_conditions';
    const url1 =
        'https://drycleaneo.com/CleaneoUser/api/termscondition/privacyPolicy';
    const url2 =
        'https://drycleaneo.com/CleaneoUser/api/termscondition/contentPolicy';
    try {
      final response0 = await http.get(Uri.parse(url0));
      final response1 = await http.get(Uri.parse(url1));
      final response2 = await http.get(Uri.parse(url2));
      if (response0.statusCode == 200) {
        final List<dynamic> tandc = json.decode(response0.body);
        final List<dynamic> privacypolicy = json.decode(response1.body);
        final List<dynamic> contentpolicy = json.decode(response2.body);
        if (tandc.isNotEmpty &&
            privacypolicy.isNotEmpty &&
            contentpolicy.isNotEmpty) {
          termsAndConditions = tandc[0];
          privacy = privacypolicy[0];
          contentPolicy = contentpolicy[0];
          print(privacy);
          return true;
        } else {
          print('Error: Invalid data format');
          return false;
        }
      } else {
        throw Exception('Failed to fetch data: ${response0.statusCode}');
      }
    } catch (e) {
      // Handle exceptions if any occur during the request.
      print('Error fetching data: $e');
      return false; // Return false in case of an error.
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTermsAndConditions();
  }

  @override
  Widget build(BuildContext context) {
    UserOTP = "";
    var mQuery = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () async {
        // Exit the app when back button is pressed
        return true;
      },
      child: Scaffold(
        body: Container(
          color: const Color(0xff006aca),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: mQuery.size.height * 0.3,
              ),
              Center(
                child: SvgPicture.asset("assets/images/mainlogo.svg"),
              ),
              SizedBox(
                height: mQuery.size.height * 0.07,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignUpPage();
                          }));
                        },
                        child: Container(
                          width: double.infinity,
                          height: mQuery.size.height * 0.06,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.signup,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SatoshiBold',
                                fontSize: mQuery.size.height * 0.023,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mQuery.size.height * 0.032,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }));
                        },
                        child: Container(
                          width: double.infinity,
                          height: mQuery.size.height * 0.06,
                          decoration: BoxDecoration(
                              color: const Color(0xff29b3fe),
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.login,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: mQuery.size.height * 0.023,
                                fontFamily: 'SatoshiBold',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
