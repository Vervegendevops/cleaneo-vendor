import 'dart:convert';

import 'package:cleaneo_vendor/Home/OrderRequests/Components/orderSummary_bottom_modal.dart';
import 'package:cleaneo_vendor/Home/OrderRequests/OrderReqDemoData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class YourOrders2Text extends StatefulWidget {
  const YourOrders2Text({Key? key}) : super(key: key);

  @override
  _YourOrders2TextState createState() => _YourOrders2TextState();
}

class _YourOrders2TextState extends State<YourOrders2Text> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    OrderRequest = OrderRequest;
  }

  int _selectedIndex = 0;
  final List<String> _tabNames = ['Ongoing', 'Previous'];

  @override
  Widget build(BuildContext context) {
    final List<List<Map<String, List<Map<String, String>>>>> _todaytabData = [
      [
        // Daily data
        {
          "ongoing": [
            {
              "orderNumber": "1",
              "time": "10:00 AM",
              "onlineMode": "Yes",
              "earning": "₹ 180"
            },
            {
              "orderNumber": "2",
              "time": "11:30 AM",
              "onlineMode": "No",
              "earning": "₹ 200"
            },
          ]
        }
      ],
      [
        // Weekly data
        {
          "orders": [
            {
              "orderNumber": "#45565",
              "time": "Mon 10:00 AM",
              "onlineMode": "Yes",
              "earning": "₹ 230",
              "items1": "WASH - 01 x Shirts(Women), 02 x T-Shirts(Men)",
              "items2": "WASH - 01 x Shirts(Women), 02 x T-Shirts(Men)",
              "items3": "WASH - 01 x Shirts(Women), 02 x T-Shirts(Men)",
              "rating": "4.5"
            },
            {
              "orderNumber": "#55525",
              "time": "Tue 11:30 AM",
              "onlineMode": "No",
              "earning": "₹ 220",
              "items1": "WASH - 01 x Shirts(Women), 02 x T-Shirts(Men)",
              "items2": "WASH - 01 x Shirts(Women), 02 x T-Shirts(Men)",
              "items3": "WASH - 01 x Shirts(Women), 02 x T-Shirts(Men)",
              "rating": "4.5"
            },
            {
              "orderNumber": "#45565",
              "time": "Wed 01:00 PM",
              "onlineMode": "Yes",
              "earning": "₹ 100",
              "items1": "WASH - 01 x Shirts(Women), 02 x T-Shirts(Men)",
              "items2": "WASH - 01 x Shirts(Women), 02 x T-Shirts(Men)",
              "items3": "WASH - 01 x Shirts(Women), 02 x T-Shirts(Men)",
              "rating": "4.5"
            },
            {
              "orderNumber": "#55525",
              "time": "Tue 11:30 AM",
              "onlineMode": "No",
              "earning": "₹ 220",
              "items1": "WASH - 01 x Shirts(Women), 02 x T-Shirts(Men)",
              "items2": "WASH - 01 x Shirts(Women), 02 x T-Shirts(Men)",
              "items3": "WASH - 01 x Shirts(Women), 02 x T-Shirts(Men)",
              "rating": "4.5"
            },
            {
              "orderNumber": "#45565",
              "time": "Wed 01:00 PM",
              "onlineMode": "Yes",
              "earning": "₹ 100",
              "items1": "WASH - 01 x Shirts(Women), 02 x T-Shirts(Men)",
              "items2": "WASH - 01 x Shirts(Women), 02 x T-Shirts(Men)",
              "items3": "WASH - 01 x Shirts(Women), 02 x T-Shirts(Men)",
              "rating": "4.5"
            },
          ]
        }
      ],
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
          child: Expanded(
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
                    width: MediaQuery.of(context).size.width * 0.47,
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
        ),

        // Content based on tab selection
        if (_selectedIndex == 0)
          OrderRequest.length == 0
              ? Expanded(
                  flex: 3,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/noorders.svg',
                          width: 320, // Adjust the width as needed
                          height: 320, // Adjust the height as needed
                        ),
                      ],
                    ),
                  ),
                )
              : orderss(),
        if (_selectedIndex == 1)
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: _todaytabData[_selectedIndex][0]["orders"]!.length,
              itemBuilder: (BuildContext context, int index) {
                var order = _todaytabData[_selectedIndex][0]["orders"]![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '${order['time']}',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 181, 181, 181),
                                fontFamily: 'SatoshiMedium',
                                fontSize: 12.0),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Container(
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
                                  0,
                                  0,
                                ), // changes the position of the shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 50.0,
                                color: const Color(0xFFF3FBFF),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.shopping_bag_outlined,
                                            color: const Color(0xFF48BDFE),
                                          ),
                                          const SizedBox(
                                            width: 6.0,
                                          ),
                                          Text(
                                            'Order ${order['orderNumber']}',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'SatoshiBold',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '${order['earning']}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'SatoshiBold',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Column(
                                  children: [
                                    const Row(
                                      children: [
                                        Text(
                                          'ITEMS',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 152, 152, 152),
                                              fontFamily: 'SatoshiMedium',
                                              fontSize: 12.0),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${order['items1']}',
                                          style: const TextStyle(
                                              color: Colors.black87,
                                              fontFamily: 'SatoshiRegular',
                                              fontSize: 10.0),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${order['items2']}',
                                          style: const TextStyle(
                                              color: Colors.black87,
                                              fontFamily: 'SatoshiRegular',
                                              fontSize: 10.0),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${order['items3']}',
                                          style: const TextStyle(
                                              color: Colors.black87,
                                              fontFamily: 'SatoshiRegular',
                                              fontSize: 10.0),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    const Divider(
                                      color: Color.fromARGB(255, 212, 212, 212),
                                      thickness: 0.7,
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 25.0,
                                          width: 70.0,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.green.withOpacity(0.3),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(50.0),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Delivered',
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontFamily: 'SatoshiMedium',
                                                  fontSize: 10.0),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.047,
                                              color: const Color(0xff29b2fe),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01,
                                            ),
                                            Text(
                                              "${order["rating"]}",
                                              style: const TextStyle(
                                                  fontFamily: 'SatoshiBold'),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16.0,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

class orderss extends StatefulWidget {
  const orderss({super.key});

  @override
  State<orderss> createState() => _orderssState();
}

class _orderssState extends State<orderss> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(OrderRequest.length, (index) {
              String created_at_str = OrderRequest[index]['created_at'];
              String formatted_date = '';
              // Convert the string to a DateTime object
              DateTime created_at = DateTime.parse(created_at_str).toLocal();

              // Get the current DateTime
              DateTime current_time = DateTime.now();

              // Get yesterday's DateTime
              DateTime yesterday = current_time.subtract(Duration(days: 1));

              // Check if the date is today
              if (created_at.day == current_time.day &&
                  created_at.month == current_time.month &&
                  created_at.year == current_time.year) {
                formatted_date =
                    "Today ${DateFormat("hh:mm a").format(created_at)}";
              }
              // Check if the date is yesterday
              else if (created_at.day == yesterday.day &&
                  created_at.month == yesterday.month &&
                  created_at.year == yesterday.year) {
                formatted_date =
                    "Yesterday ${DateFormat("hh:mm a").format(created_at)}";
              }
              // Display the full date if it's more than yesterday
              else {
                formatted_date =
                    DateFormat("dd'th' MMMM, yyyy").format(created_at);
              }
              List<dynamic> anything =
                  jsonDecode(OrderRequest[index]['status']);
              print(anything.length);
              setState(() {
                statuscount = anything.length;
              });
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      children: [
                        Text(
                          formatted_date,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 181, 181, 181),
                              fontFamily: 'SatoshiMedium',
                              fontSize: 12.0),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 7,
                            offset: const Offset(
                              0,
                              0,
                            ), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              color: Color(0xffe9f8ff),
                            ),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.06,
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Text(
                                  'Order ID : ${OrderRequest[index]['OrderID']}',
                                  style: const TextStyle(
                                      fontSize: 13, fontFamily: 'SatoshiBold'),
                                ),
                                const Expanded(child: SizedBox()),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.loc,
                                  style: const TextStyle(
                                      color: Colors.black54,
                                      fontFamily: 'SatoshiMedium',
                                      fontSize: 13),
                                ),
                                Text(
                                  AppLocalizations.of(context)!.acceptin,
                                  style: const TextStyle(
                                      color: Colors.black54,
                                      fontFamily: 'SatoshiMedium',
                                      fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.045,
                                  height: MediaQuery.of(context).size.height *
                                      0.035,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff29b2fe)),
                                  child: Center(
                                    child: Icon(
                                      Icons.home,
                                      color: Colors.white,
                                      size: MediaQuery.of(context).size.width *
                                          0.03,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Text(
                                  '${OrderRequest[index]["Caddress"].substring(0, 25)}...',
                                  style: const TextStyle(
                                      fontSize: 12, fontFamily: 'SatoshiBold'),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                  OrderRequest[index]["PickupTime"],
                                  style: const TextStyle(
                                      color: Color(0xff29b2fe),
                                      fontSize: 12,
                                      fontFamily: 'SatoshiBold'),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Divider(
                              color: Color.fromARGB(255, 212, 212, 212),
                              thickness: 0.7,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .pickdatetime,
                                        style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'SatoshiMedium',
                                            fontSize: 12),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.006,
                                      ),
                                      Text(
                                        '${OrderRequest[index]['PickupDate']} | ${OrderRequest[index]['PickupTime']}',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'SatoshiMedium'),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 45.0,
                                  width: 0.4,
                                  color:
                                      const Color.fromARGB(255, 195, 195, 195),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .deldatetime,
                                        style: const TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'SatoshiMedium',
                                            fontSize: 12),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.006,
                                      ),
                                      Text(
                                        '${OrderRequest[index]['DeliveryDate']} | ${OrderRequest[index]['DeliveryTime']}',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'SatoshiMedium'),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Call the function to open the bottom-up modal
                                  orderSummary(context, OrderRequest[index]);
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height: MediaQuery.of(context).size.height *
                                      0.045,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    color: Color(0xff29b2fe),
                                  ),
                                  child: Center(
                                    child: Text(
                                      // AppLocalizations.of(context)!.acceptorder,
                                      "VIEW ORDER",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontFamily: 'SatoshiBold',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
