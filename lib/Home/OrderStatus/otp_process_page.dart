import 'package:flutter/material.dart';

class OTPProcessPage extends StatefulWidget {
  const OTPProcessPage({Key? key}) : super(key: key);

  @override
  State<OTPProcessPage> createState() => _OTPProcessPageState();
}

class _OTPProcessPageState extends State<OTPProcessPage> {
  var pickupOTP = 178462;
  var deliveryOTP = 600808;
  var mobileNo = "+91 6346583651";

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
                top: mQuery.size.height * 0.058,
                bottom: mQuery.size.height * 0.03,
                left: mQuery.size.width * 0.045,
                right: mQuery.size.width * 0.045,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: mQuery.size.width * 0.045,
                  ),
                  Text(
                    "OTP",
                    style: TextStyle(
                      fontSize: mQuery.size.height * 0.027,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pickup OTP",
                        style: TextStyle(
                            fontSize: mQuery.size.width * 0.05,
                            fontFamily: 'SatoshiBold'),
                      ),
                      SizedBox(
                        height: mQuery.size.height * 0.016,
                      ),
                      Text(
                          "Please share this OTP when Delivery Agent arrives with the Order."),
                      SizedBox(
                        height: mQuery.size.height * 0.023,
                      ),
                      Text(
                        "$pickupOTP",
                        style: TextStyle(
                            fontSize: mQuery.size.width * 0.05,
                            fontFamily: 'SatoshiBold',
                            color: Colors.red),
                      ),
                      SizedBox(height: mQuery.size.height*0.02,),
                      Container(
                        width: double.infinity,
                        height: mQuery.size.height * 0.065,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffededed)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Contact Support",style: TextStyle(
                              color: Color(0xff29b2fe),
                              fontFamily: 'SatoshiMedium'
                            ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: mQuery.size.width*0.06,
                                  height: mQuery.size.height*0.026,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff29b2fe)
                                  ),
                                  child: Center(
                                    child: Icon(Icons.phone_outlined,color: Colors.white,
                                      size: 12),
                                  ),
                                ),
                                SizedBox(width: mQuery.size.width*0.01,),
                                Text("$mobileNo",style: TextStyle(
                                    fontFamily: 'SatoshiMedium',
                                  fontSize: 13
                                ),),
                              ],
                            ),
                          ],
                        )
                      ),
                      SizedBox(height: mQuery.size.height * 0.2),
                      Text(
                        "Delivery OTP",
                        style: TextStyle(
                            fontSize: mQuery.size.width * 0.05,
                            fontFamily: 'SatoshiBold'),
                      ),
                      SizedBox(
                        height: mQuery.size.height * 0.016,
                      ),
                      Text(
                          "Please share this OTP when Delivery Agent arrives to Pickup the Order."),
                      SizedBox(
                        height: mQuery.size.height * 0.023,
                      ),
                      Text(
                        "$deliveryOTP",
                        style: TextStyle(
                            fontSize: mQuery.size.width * 0.05,
                            fontFamily: 'SatoshiBold',
                            color: Colors.green),
                      ),
                      SizedBox(height: mQuery.size.height*0.02,),
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
