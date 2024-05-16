import 'package:cleaneo_vendor/Home/Drawer.dart';
import 'package:cleaneo_vendor/Home/Ledger/Components/dropDownLedger.dart';
import 'package:cleaneo_vendor/Home/OrderStatus/Components/DropDown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

class Ledger extends StatefulWidget {
  const Ledger({Key? key}) : super(key: key);

  @override
  State<Ledger> createState() => _LedgerState();
}

class _LedgerState extends State<Ledger> {
  TextEditingController storeNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController gstinController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> orders = [
    {"status": "Accepted", "time": "11:30 AM", "date": "Today"},
    {"status": "In Process", "time": "11:30 AM", "date": "Today"},
    {"status": "On its way", "time": "11:30 AM", "date": "Yesterday"},
    {"status": "Delivered", "time": "11:30 AM", "date": "23rd Jun, 2023"},
  ];

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
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
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: mQuery.size.width * 0.045,
                  ),
                  const Text(
                    "Ledger",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'SatoshiBold'),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Orders",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'SatoshiMedium'),
                        ),
                        DropdownLedger(),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 0.5,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        //main height
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 21.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 0,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 0), // changes the position of the shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20.0,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Amount",
                                    style: TextStyle(
                                      fontFamily: 'SatoshiBold',
                                        fontSize: 15,
                                        color: Colors.black,
                                        ),
                                  ),
                                  Text(
                                    "₹ 1,600",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: 'SatoshiBold'),
                                  ),
                                ],
                              ),
                              // const SizedBox(
                              //   height: 12.0,
                              // ),
                              // SvgPicture.asset(
                              //   "assets/images/dashedledger.svg",
                              //   width: mQuery.size.width * 0.9,
                              // ),
                              // const SizedBox(
                              //   height: 12.0,
                              // ),
                              // const Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(
                              //       "Cash Collected",
                              //       style: TextStyle(
                              //           fontSize: 14,
                              //           color: Colors.black54,
                              //           fontWeight: FontWeight.w500),
                              //     ),
                              //     Text(
                              //       "₹ 800",
                              //       style: TextStyle(
                              //           fontSize: 16,
                              //           color: Colors.green,
                              //           fontWeight: FontWeight.w500),
                              //     ),
                              //   ],
                              // ),
                              //online
                              // const SizedBox(
                              //   height: 12.0,
                              // ),
                              // SvgPicture.asset(
                              //   "assets/images/dashedledger.svg",
                              //   width: mQuery.size.width * 0.9,
                              // ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              // const Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(
                              //       "Cleaneo (Online Payment)",
                              //       style: TextStyle(
                              //           fontSize: 14,
                              //           color: Colors.black54,
                              //           fontWeight: FontWeight.w500),
                              //     ),
                              //     Text(
                              //       "₹ 800",
                              //       style: TextStyle(
                              //           fontSize: 16,
                              //           color: Color(0xFF48BDFE),
                              //           fontWeight: FontWeight.w500),
                              //     ),
                              //   ],
                              // ),
                              //commision
                              // const SizedBox(
                              //   height: 12.0,
                              // ),
                              SvgPicture.asset(
                                "assets/images/dashedledger.svg",
                                width: mQuery.size.width * 0.9,
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Cleaneo Commission (20%)",
                                    style: TextStyle(
                                      fontSize: 13,
                                        color: Colors.black54,
                                        fontFamily: 'SatoshiMedium'),
                                  ),
                                  Text(
                                    "₹ 320",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF48BDFE),
                                        fontFamily: 'SatoshiMedium'),
                                  ),
                                ],
                              ),
                              //fees
                              const SizedBox(
                                height: 12.0,
                              ),
                              SvgPicture.asset(
                                "assets/images/dashedledger.svg",
                                width: mQuery.size.width * 0.9,
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Convenience Fees (2.5%)",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'SatoshiMedium',
                                        color: Colors.black54,
                                    ),
                                  ),
                                  Text(
                                    "₹ 40",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'SatoshiMedium',
                                        color: Color(0xFF48BDFE),
                                        ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 24.0,
                              ),
                              Divider(
                                color: Color.fromARGB(255, 212, 212, 212),
                                thickness: 1.5,
                              ),
                              const SizedBox(
                                height: 6.0,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Your Earnings",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: 'SatoshiBold'),
                                  ),
                                  Text(
                                    "₹ 1,240",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.green,
                                        fontFamily: 'SatoshiBold'),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
