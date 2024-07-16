import 'package:cleaneo_vendor/bloc/home/home_bloc.dart';
import 'package:cleaneo_vendor/bloc/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../Drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class NavigationWithTabs extends StatefulWidget {
  const NavigationWithTabs({Key? key}) : super(key: key);

  @override
  _NavigationWithTabsState createState() => _NavigationWithTabsState();
}

class _NavigationWithTabsState extends State<NavigationWithTabs> {
  int _selectedIndex = 0;
  final List<String> _tabNames = ['Daily', 'Weekly', 'Monthly'];

  final List<List<Map<String, List<Map<String, String>>>>> _tabData = [
    [
      // Daily data
      {
        "orders": [
          {
            "orderNumber": "1",
            "time": "10:00 AM",
            "onlineMode": "Yes",
            "earning": "₹ 180",
            "date" : "22/02/2024"
          },
          {
            "orderNumber": "2",
            "time": "11:30 AM",
            "onlineMode": "No",
            "earning": "₹ 200",
            "date" : "24/02/2024"
          },
          {
            "orderNumber": "3",
            "time": "01:00 PM",
            "onlineMode": "Yes",
            "earning": "₹ 230",
            "date" : "27/02/2024"
          },
          {
            "orderNumber": "2",
            "time": "11:30 AM",
            "onlineMode": "No",
            "earning": "₹ 200",
            "date" : "02/03/2024"
          },
        ]
      }
    ],
    [
      // Weekly data
      {
        "orders": [
          {
            "orderNumber": "4",
            "time": "Mon 10:00 AM",
            "onlineMode": "Yes",
            "earning": "₹ 230",
            "date" : "12/04/2024"
          },
          {
            "orderNumber": "5",
            "time": "Tue 11:30 AM",
            "onlineMode": "No",
            "earning": "₹ 220",
            "date" : "07/02/2024"
          },
          {
            "orderNumber": "6",
            "time": "Wed 01:00 PM",
            "onlineMode": "Yes",
            "earning": "₹ 100",
            "date" : "16/02/2024"
          },
        ]
      }
    ],
    [
      // Monthly data
      {
        "orders": [
          {
            "orderNumber": "7",
            "time": "Jan 10:00 AM",
            "onlineMode": "Yes",
            "earning": "₹ 300",
            "date" : "28/02/2024"
          },
          {
            "orderNumber": "8",
            "time": "Feb 11:30 AM",
            "onlineMode": "No",
            "earning": "₹ 190",
            "date" : "10/02/2024"
          },
          {
            "orderNumber": "9",
            "time": "Mar 01:00 PM",
            "onlineMode": "Yes",
            "earning": "₹ 200",
            "date" : "24/02/2024"
          },
        ]
      }
    ]
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
      body: Stack(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
  builder: (context, state) {
    return Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                            Text(
                              AppLocalizations.of(context)!.myEarnings,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'SatoshiBold'
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _tabNames.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Container(
                          width: mQuery.size.width * 0.32,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: _selectedIndex == index
                                    ? const Color(0xFF29B2FE)
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              _tabNames[index],
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'SatoshiBold',
                                color: _selectedIndex == index
                                    ? const Color(0xFF29B2FE)
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                _selectedIndex==0?
                Expanded(
                  child: ListView.builder(
                    itemCount: state.cashCollectionResponsse.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      var order = state.cashCollectionResponsse.data[index];
                      if(state.cashCollectionResponsse.data.isNotEmpty){
                        return Container(
                          height: mQuery.size.height * 0.08,
                          width: mQuery.size.width,
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
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // if (order["onlineMode"] == "Yes")
                                  //   SizedBox(
                                  //       height: 30,
                                  //       width: 30,
                                  //       child: SvgPicture.asset(
                                  //         "assets/earning1.svg",
                                  //       )),
                                  // if (order["onlineMode"] == "No")
                                  SizedBox(
                                      height: 31,
                                      width: 31,
                                      child: SvgPicture.asset(
                                          "assets/earning2.svg",
                                          color: Color(0xFF13A32B)
                                      )),
                                  const SizedBox(
                                    width: 16.0,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Order: ${order.orderId}',
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'SatoshiBold'
                                        ),
                                      ),
                                      // SizedBox(height: 5.0),
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.7,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${order.transactionDate}',
                                              style: const TextStyle(
                                                  fontSize: 10.0,
                                                  fontFamily: 'SatoshiMedium',
                                                  color: Colors.grey),
                                            ),
                                            Text(
                                              '${order.amountAfterCommission}',
                                              style: const TextStyle(
                                                  color: Color(0xFF13A32B),
                                                  fontFamily: 'SatoshiBold'),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text("29/04/2026",style: TextStyle(
                                          fontFamily: 'SatoshiRegular',
                                          fontSize: mQuery.size.height*0.016
                                      ),)

                                    ],
                                  ),
                                  // if (order["onlineMode"] == "Yes")
                                  //   Text(
                                  //     '${order["earning"]}',
                                  //     style: const TextStyle(
                                  //         color: Color(0xFF29B2FE),
                                  //     fontFamily: 'SatoshiBold'),
                                  //   ),
                                  // if (order["onlineMode"] == "No")

                                ],
                              ),
                            ),
                          ),
                        );

                      }
                      else{
                        return Center(child: Text("No Data Found"),);
                      }
                    },
                  ),):Container()
              ],
            ),
          );
  },
),
        ],
      ),
    );
  }
}
