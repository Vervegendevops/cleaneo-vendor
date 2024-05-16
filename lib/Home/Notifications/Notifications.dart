import 'package:cleaneo_vendor/Home/Drawer.dart';
import 'package:cleaneo_vendor/Home/Notifications/Components/notiData.dart';
import 'package:cleaneo_vendor/Home/Notifications/Components/reportDispute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  const Text(
                    "Notifications",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'SatoshiBold'),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: mQuery.size.width * 0.3,
                      ),
                      const Text(
                        "Clear All",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'SatoshiBold'),
                      ),
                    ],
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
                child: ListView.builder(
                  itemCount: NotificationsData
                      .length, // Replace dataList with your list of dynamic data
                  itemBuilder: (context, index) {
                    final Map<String, dynamic> data = NotificationsData[index];
                    return Padding(
                      //
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 12.0,
                          ),
                          Row(
                            children: [
                              Text(
                                data['notidate'],
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 181, 181, 181),
                                    fontFamily: 'SatoshiMedium',
                                    fontSize: 12.0),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            width: mQuery.size.width * 0.9,
                            // height: mQuery.size.height * 0.28,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 0,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                            ),
                            // padding: EdgeInsets.all(mQuery.size.width * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                    ),
                                    color: Colors.white,
                                  ),
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: mQuery.size.width * 0.03),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${data['notitype']}',
                                              style: const TextStyle(
                                                 fontFamily: 'SatoshiBold',
                                                  color: Color(0xff29b2fe)),
                                            ),
                                            data["notitype"] == 'Order Received'
                                                ? Text(
                                                    "Order ${data["ordernumber"]} Received Succesfully",
                                                    style: const TextStyle(
                                                        fontSize: 10,
                                                        fontFamily: 'SatoshiMedium',
                                                        color: Colors.black),
                                                  )
                                                : Text(
                                                    "Order ${data["ordernumber"]} Delivered Succesfully",
                                                    style: const TextStyle(
                                                        fontSize: 11,
                                                        fontFamily: 'SatoshiMedium',
                                                        color: Colors.black),
                                                  ),
                                          ],
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Icon(
                                        Icons.delete_outline_rounded,
                                        size: mQuery.size.width * 0.047,
                                        color: const Color(0xff29b2fe),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: mQuery.size.height * 0.01,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.loc,
                                        style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'SatoshiMedium',
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: mQuery.size.width * 0.045,
                                        height: mQuery.size.height * 0.035,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff29b2fe)),
                                        child: Center(
                                          child: Icon(
                                            Icons.home,
                                            color: Colors.white,
                                            size: mQuery.size.width * 0.03,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: mQuery.size.width * 0.02,
                                      ),
                                      Text(
                                        data["location"],
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'SatoshiBold'),
                                      ),
                                      const Expanded(child: SizedBox()),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Divider(
                                    color: Color.fromARGB(255, 212, 212, 212),
                                    thickness: 0.7,
                                  ),
                                ),
                                SizedBox(
                                  height: mQuery.size.height * 0.01,
                                ),
                                if (data["notitype"] == 'Order Received')
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const ReportDispute();
                                      }));
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 50,
                                      color: const Color(0xFFF3FBFF),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.warning_amber_rounded,
                                            color: Colors.red,
                                          ),
                                          SizedBox(
                                            width: 8.0,
                                          ),
                                          Text(
                                            "Report Dispute",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontFamily: 'SatoshiBold'
                                               ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                if (data["notitype"] == 'Order Delivered')
                                  Container(
                                    width: double.infinity,
                                    height: 50,
                                    color: const Color(0xFFF3FBFF),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.download_done_rounded,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 8.0,
                                        ),
                                        Text(
                                          "Order Delivered Succesfully",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontFamily: 'SatoshiBold'),
                                        )
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
