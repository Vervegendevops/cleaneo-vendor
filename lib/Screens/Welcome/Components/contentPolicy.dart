import 'package:cleaneo_vendor/Screens/Welcome/WelcomePage.dart';
import 'package:flutter/material.dart';

class CP extends StatefulWidget {
  const CP({Key? key}) : super(key: key);

  @override
  State<CP> createState() => _CPState();
}

class _CPState extends State<CP> {
  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
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
                top: mQuery.size.height*0.058,
                bottom: mQuery.size.height*0.03,
                left: mQuery.size.width*0.045,
                right: mQuery.size.width*0.045,
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
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: mQuery.size.width * 0.045,
                  ),
                  Text(
                    "Content Policies",
                    style: TextStyle(
                      fontSize: mQuery.size.height*0.027,
                      color: Colors.white,
                      fontFamily: 'SatoshiBold',),
                  )
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
                  padding: EdgeInsets.only(
                    top: mQuery.size.height*0.028,
                    left: mQuery.size.width*0.045,
                    right: mQuery.size.width*0.045,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Welcome to our demo service! Before you begin using our platform, please read the following Terms of Service carefully. By accessing or using our service, you agree to be bound by these Terms. If you do not agree to these Terms, please do not use our service.",
                        style: TextStyle(
                            fontSize: mQuery.size.height*0.0165,
                            fontFamily: 'SatoshiMedium'
                        ),
                      ),
                      SizedBox(height: mQuery.size.height * 0.01),
                      Text(
                        "Welcome to our demo service! Before you begin using our platform, please read the following Terms of Service carefully. By accessing or using our service, you agree to be bound by these Terms. If you do not agree to these Terms, please do not use our service.",
                        style: TextStyle(
                            fontSize: mQuery.size.height*0.0165,
                            fontFamily: 'SatoshiMedium'
                        ),
                      ),
                      SizedBox(height: mQuery.size.height * 0.01),
                      Text(
                        "Welcome to our demo service! Before you begin using our platform, please read the following Terms of Service carefully. By accessing or using our service, you agree to be bound by these Terms. If you do not agree to these Terms, please do not use our service.",
                        style: TextStyle(
                            fontSize: mQuery.size.height*0.0165,
                            fontFamily: 'SatoshiMedium'
                        ),)
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
