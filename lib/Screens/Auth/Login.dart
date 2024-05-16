import 'dart:math';
import 'package:cleaneo_vendor/Constant/signupVariables.dart';
import 'package:cleaneo_vendor/Screens/Auth/otp_page.dart';
import 'package:cleaneo_vendor/Screens/Auth/Signup.dart';
import 'package:cleaneo_vendor/Screens/Welcome/WelcomePage.dart';
import 'package:cleaneo_vendor/main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:country_code_picker/country_code_picker.dart';

final authentication = GetStorage();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phonenoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool tns = false;
  bool ispressed = false;
  PhoneNumber? phoneNumber;
  String selectedCountryCode = 'IN';
  double _opacity = 0.5;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  Future<Object> fetchResponse(String phoneNumber) async {
    final url =
        'https://drycleaneo.com/CleaneoVendor/api/signedUp/$phoneNumber';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print(response.body);
        if (response.body == "false") {
          setState(() {
            ispressed = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User does not exists. Please Sign up.'),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(16.0),
            ),
          );
        } else {
          uniqueOTP = (1000 + Random().nextInt(9000)).toString();
          authentication.write('Authentication', 'loggedIN');
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return OTPPage();
          }));
        }
        return response.body == 'true';
      } else {
        // If the response status code is not 200, throw an exception or handle
        // the error accordingly.
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions if any occur during the request.
      print('Error fetching data: $e');
      return false; // Return false in case of an error.
    }
  }

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return AnimatedOpacity(
      opacity: _opacity, // Use the opacity variable
      duration: Duration(milliseconds: 500),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return WelcomePage();
                          }));
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: mQuery.size.width * 0.045,
                    ),
                    Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: mQuery.size.height * 0.027,
                        color: Colors.white,
                        fontFamily: 'SatoshiBold',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
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
                            height: mQuery.size.height * 0.03,
                          ),
                          // PHONE NUMBER
                          Text(
                            "Phone Number*",
                            style: TextStyle(
                              fontFamily: 'SatoshiBold',
                              fontSize: mQuery.size.height * 0.02,
                            ),
                          ),
                          SizedBox(
                            height: mQuery.size.height * 0.01,
                          ),

                          Container(
                            width: double.infinity,
                            height: mQuery.size.height * 0.066,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: mQuery.size.width * 0.03),
                                Icon(Icons.phone_outlined),
                                CountryCodePicker(
                                  onChanged: (code) {
                                    setState(() {
                                      selectedCountryCode = code.dialCode!;
                                    });
                                  },
                                  initialSelection: 'IN',
                                  favorite: ['+91', 'IN'],
                                  showCountryOnly: false,
                                  showFlag: true,
                                  showOnlyCountryWhenClosed: false,
                                  alignLeft: false,
                                ),
                                // "|" symbol
                                SizedBox(
                                  height: mQuery.size.height * 0.03,
                                  child: VerticalDivider(
                                    thickness: 1.5,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: mQuery.size.width * 0.01),
                                // Phone number input
                                Expanded(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    cursorColor: Colors.grey,
                                    controller: phonenoController,
                                    maxLength: 10,
                                    onChanged: (value) {
                                      setState(() {
                                        UserPhone = value;
                                        phoneFinal = UserPhone;
                                      });
                                    },
                                    onSubmitted: (value) {
                                      setState(() {
                                        UserPhone = value;
                                        phoneFinal = UserPhone;
                                      });
                                    },
                                    onEditingComplete: () {
                                      // UserPhone = phonenoController as String;
                                    },
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter
                                          .digitsOnly // Allow only numeric input
                                    ],
                                    decoration: InputDecoration(
                                      hintText: "Enter Phone Number*",
                                      hintStyle: TextStyle(
                                        fontSize: mQuery.size.height * 0.02,
                                        fontFamily: 'SatoshiMedium',
                                        color: Color(0xffABAFB1),
                                      ),
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 2),
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      counter: SizedBox.shrink(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          (phoneFinal.length > 0 && phoneFinal.length < 10)
                              ? Text(
                                  "*Please enter a valid mobile number.",
                                  style: TextStyle(
                                      fontSize: mQuery.size.height * 0.013,
                                      fontFamily: 'SatoshiMedium',
                                      color: Colors.red),
                                )
                              : Text(
                                  "*We'll send a one time 4-digit OTP to your phone",
                                  style: TextStyle(
                                      fontSize: mQuery.size.height * 0.013,
                                      fontFamily: 'SatoshiMedium',
                                      color: Colors.grey),
                                ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                checkColor: Color(0xffffffff),
                                activeColor: Color(0xff29b2fe),
                                value: tns,
                                onChanged: (value) {
                                  setState(() {
                                    tns = !tns;
                                  });
                                },
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "By Continuing, you agree to our  ",
                                        style: TextStyle(
                                          fontSize: mQuery.size.width * 0.025,
                                          color: tns == false
                                              ? Colors.grey
                                              : Colors.black,
                                          fontFamily: 'SatoshiRegular',
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.push(context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) {
                                          // return TS();
                                          // }));
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return IntrinsicHeight(
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      1,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              topRight: Radius
                                                                  .circular(
                                                                      20))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Terms of Service",
                                                          style: TextStyle(
                                                            fontSize: mQuery
                                                                    .size
                                                                    .height *
                                                                0.027,
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'SatoshiBold',
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(
                                                          termsAndConditions,
                                                          style: TextStyle(
                                                              fontSize: mQuery
                                                                      .size
                                                                      .height *
                                                                  0.0165,
                                                              fontFamily:
                                                                  'SatoshiMedium'),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Terms of Service ",
                                              style: TextStyle(
                                                fontSize:
                                                    mQuery.size.width * 0.025,
                                                color: tns == false
                                                    ? Colors.grey
                                                    : Colors.black,
                                                fontFamily: 'SatoshiMedium',
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: tns == false
                                                    ? Colors.grey
                                                    : Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        ' , ',
                                        style: TextStyle(
                                          fontSize: mQuery.size.width * 0.025,
                                          color: tns == false
                                              ? Colors.grey
                                              : Colors.black,
                                          fontFamily: 'SatoshiMedium',
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.push(context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) {
                                          // return PP();
                                          // }));
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return IntrinsicHeight(
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      1,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              topRight: Radius
                                                                  .circular(
                                                                      20))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Privacy Policy",
                                                          style: TextStyle(
                                                            fontSize: mQuery
                                                                    .size
                                                                    .height *
                                                                0.027,
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'SatoshiBold',
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(
                                                          privacy,
                                                          style: TextStyle(
                                                              fontSize: mQuery
                                                                      .size
                                                                      .height *
                                                                  0.0165,
                                                              fontFamily:
                                                                  'SatoshiMedium'),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Privacy Policy",
                                              style: TextStyle(
                                                fontSize:
                                                    mQuery.size.width * 0.025,
                                                color: tns == false
                                                    ? Colors.grey
                                                    : Colors.black,
                                                fontFamily: 'SatoshiMedium',
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: tns == false
                                                    ? Colors.grey
                                                    : Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        ' and ',
                                        style: TextStyle(
                                          fontSize: mQuery.size.width * 0.025,
                                          color: tns == false
                                              ? Colors.grey
                                              : Colors.black,
                                          fontFamily: 'SatoshiMedium',
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.push(context,
                                          //     MaterialPageRoute(builder: (context) {
                                          // return CP();
                                          // }));
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return IntrinsicHeight(
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      1,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              topRight: Radius
                                                                  .circular(
                                                                      20))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Content Policies",
                                                          style: TextStyle(
                                                            fontSize: mQuery
                                                                    .size
                                                                    .height *
                                                                0.027,
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'SatoshiBold',
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(
                                                          contentPolicy,
                                                          style: TextStyle(
                                                              fontSize: mQuery
                                                                      .size
                                                                      .height *
                                                                  0.0165,
                                                              fontFamily:
                                                                  'SatoshiMedium'),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Text(
                                          "Content Policies",
                                          style: TextStyle(
                                            fontSize: mQuery.size.width * 0.025,
                                            color: tns == false
                                                ? Colors.grey
                                                : Colors.black,
                                            fontFamily: 'SatoshiMedium',
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: tns == false
                                                ? Colors.grey
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),

                          SizedBox(
                            height: mQuery.size.height * 0.47,
                          ),
                          GestureDetector(
                            onTap: tns == false
                                ? null
                                : () {
                                    Otp = 'Login';
                                    setState(() {
                                      ispressed = true;
                                    });
                                    if (phoneFinal.length == 10) {
                                      fetchResponse(phoneFinal);
                                    } else {
                                      setState(() {
                                        ispressed = false;
                                      });
                                    }

                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (context) {
                                    //   return OTPPage();
                                    // }));
                                  },
                            child: Container(
                              width: double.infinity,
                              height: mQuery.size.height * 0.06,
                              decoration: BoxDecoration(
                                  color: tns == false || phoneFinal.length != 10
                                      ? Color.fromARGB(145, 41, 179, 254)
                                      : Color(0xff29b2fe),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      ispressed == false
                                          ? "Log In"
                                          : "Sending OTP",
                                      style: TextStyle(
                                        fontSize: mQuery.size.height * 0.02,
                                        color: Colors.white,
                                        fontFamily: 'SatoshiBold',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    if (ispressed == true)
                                      GFLoader(
                                        type: GFLoaderType.ios,
                                        loaderColorOne: Colors.white,
                                        loaderColorThree: Colors.white,
                                        loaderColorTwo: Colors.white,
                                      )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: mQuery.size.height * 0.034,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  fontSize: mQuery.size.height * 0.02,
                                  fontFamily: 'SatoshiBold',
                                ),
                              ),
                              SizedBox(
                                width: mQuery.size.width * 0.02,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SignUpPage();
                                  }));
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: mQuery.size.height * 0.02,
                                      fontFamily: 'SatoshiBold',
                                      color: Color(0xff29b2fe)),
                                ),
                              )
                            ],
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
      ),
    );
  }
}
