import 'dart:convert';

import 'package:cleaneo_vendor/Home/OrderRequests/Components/orderSummary_bottom_modal.dart';
import 'package:cleaneo_vendor/Home/OrderRequests/OrderReqDemoData.dart';
import 'package:cleaneo_vendor/bloc/orders_bloc.dart';
import 'package:cleaneo_vendor/bloc/orders_event.dart';
import 'package:cleaneo_vendor/bloc/orders_state.dart';
import 'package:cleaneo_vendor/model/order_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common_widgets/productDetailsWidgets.dart';
import '../../../main.dart';
import '../../Drawer.dart';
import 'package:http/http.dart'as http;

import '../../OrderRequests/Components/ChangeSatusSheet.dart';

class YourOrders2Text extends StatefulWidget {
  const YourOrders2Text({Key? key}) : super(key: key);

  @override
  _YourOrders2TextState createState() => _YourOrders2TextState();
}

class _YourOrders2TextState extends State<YourOrders2Text> {
  TextEditingController storeNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController gstinController = TextEditingController();
  Future<Object> fetchResponse() async {
    final url =
        'https://drycleaneo.com/CleaneoVendor/api/orderRequest/${UserLoggedIn.read('UID')}';
    print("url===$url");

    try {
      final response = await http.get(Uri.parse(url));
      print("response====${response.body}");

      if (response.statusCode == 200) {
        setState(() {
          print(response.body);
          OrderRequest = jsonDecode(response.body);
        });
        print(OrderRequest[0]['created_at']);
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map<String, dynamic>> orders = [
    {
      "status": "Accepted",
      "time": "11:30 AM",
    },
    {
      "status": "In Process",
      "time": "11:30 AM",
    },
    {
      "status": "On its way",
      "time": "11:30 AM",
    },
    {
      "status": "Delivered",
      "time": "11:30 AM",
    },
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchResponse();
  }

  int _selectedIndex = 0;
  final List<String> _tabNames = ['Ongoing', 'Previous'];

  @override
  Widget build(BuildContext context) {
    OrderRequest = OrderRequest;
    var mQuery = MediaQuery.of(context);
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
    return Scaffold(
      drawer: MyDrawer(),
      key: _scaffoldKey,

      body: Stack(
        children: [
          BlocBuilder<OrdersBloc, OrdersState>(
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
                            const Row(
                              children: [
                                Text(
                                  "Your Orders",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontFamily: 'SatoshiBold'),
                                ),
                              ],
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
                            if(_selectedIndex==0){
                              BlocProvider.of<OrdersBloc>(context).add(GetOrderEvent());
                            }
                            else{
                              BlocProvider.of<OrdersBloc>(context).add(GetPreviousOrderEvent());

                            }
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

                // Content based on tab selection
                _selectedIndex == 0?Expanded(
                    child: ListView.builder(
                        itemCount: state.orderlist.length,
                        itemBuilder: (context,index){

                          var order=state.orderlist[index];
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
                                  order.deliveryTime,
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
                                    height:
                                    MediaQuery.of(context).size.height * 0.06,
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                      MediaQuery.of(context).size.width *
                                          0.03,
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width:
                                          MediaQuery.of(context).size.width *
                                              0.02,
                                        ),
                                        Text(
                                          'Order ID : ${order.orderId}',
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'SatoshiBold'),
                                        ),
                                        const Expanded(child: SizedBox()),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                    MediaQuery.of(context).size.height * 0.01,
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width *
                                              0.045,
                                          height:
                                          MediaQuery.of(context).size.height *
                                              0.035,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff29b2fe)),
                                          child: Center(
                                            child: Icon(
                                              Icons.home,
                                              color: Colors.white,
                                              size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.03,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                          MediaQuery.of(context).size.width *
                                              0.02,
                                        ),
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width * 0.5,
                                          child: Text(
                                            '${order.cAddress}...',
                                            style: const TextStyle(

                                                fontSize: 12,
                                                fontFamily: 'SatoshiBold'),
                                            maxLines: 2,
                                          ),
                                        ),
                                        const Expanded(child: SizedBox()),
                                        Text(
                                          order.pickupTime,
                                          style: const TextStyle(
                                              color: Color(0xff29b2fe),
                                              fontSize: 12,
                                              fontFamily: 'SatoshiBold'),
                                        )
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
                                    height:
                                    MediaQuery.of(context).size.height * 0.01,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.006,
                                              ),
                                              Text(
                                                '${order.pickupDate} | ${order.pickupTime}',
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
                                          color: const Color.fromARGB(
                                              255, 195, 195, 195),
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
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.006,
                                              ),
                                              Text(
                                                '${order.deliveryDate} | ${order.deliveryTime}',
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
                                    height:
                                    MediaQuery.of(context).size.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Call the function to open the bottom-up modal
                                          // orderSummary(
                                          //     context, orders[index],order);
                                          showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            builder: (BuildContext context) {
                                              countStatus = order.status.length;
                                             // String totalSum = '₹ ${calculateTotal(prices).toStringAsFixed(2)}';
                                              return Container(
                                                  decoration: const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(12),
                                                        topRight: Radius.circular(12),
                                                      )),
                                                  width: double.infinity,
                                                  height: MediaQuery.of(context).size.height * 0.8,
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        child: ListView(
                                                          children: [
                                                            const Padding(
                                                              padding: EdgeInsets.only(left: 24.0, top: 18.0),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "Pickup Order Summary",
                                                                    style: TextStyle(
                                                                      fontFamily: 'SatoshiBold',
                                                                      fontSize: 18.0,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: MediaQuery.of(context).size.height * 0.01,
                                                            ),
                                                            Container(
                                                              width:MediaQuery.of(context).size.width,
                                                              decoration: const BoxDecoration(
                                                                  color: const Color(0xffebf7ed),
                                                                  borderRadius: BorderRadius.only(
                                                                    topLeft: Radius.circular(12),
                                                                    topRight: Radius.circular(12),
                                                                  )),
                                                              height: MediaQuery.of(context).size.height * 0.08,
                                                              padding: EdgeInsets.symmetric(
                                                                  horizontal: MediaQuery.of(context).size.width * 0.04),
                                                              child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      SizedBox(
                                                                        height:
                                                                        MediaQuery.of(context).size.height * 0.016,
                                                                      ),
                                                                      Row(
                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            'Order ID :${order.orderId}',
                                                                            style: TextStyle(
                                                                                fontSize:
                                                                                MediaQuery.of(context).size.height *
                                                                                    0.018,
                                                                                fontFamily: 'SatoshiBold'),
                                                                          ),
                                                                          SizedBox(
                                                                            width: MediaQuery.of(context).size.width *
                                                                                0.36,
                                                                          ),
                                                                          // Row(children: [
                                                                          //   Container(
                                                                          //     width: MediaQuery.of(context).size.width * 0.05,
                                                                          //     height: MediaQuery.of(context).size.height * 0.04,
                                                                          //     decoration: const BoxDecoration(
                                                                          //         shape: BoxShape.circle,
                                                                          //         color: Color(0xff29b2fe)),
                                                                          //     child: Center(
                                                                          //       child: Icon(
                                                                          //         Icons.home,
                                                                          //         color: Colors.white,
                                                                          //         size: MediaQuery.of(context).size.width * 0.033,
                                                                          //       ),
                                                                          //     ),
                                                                          //   ),
                                                                          //   SizedBox(
                                                                          //     width: MediaQuery.of(context).size.width * 0.02,
                                                                          //   ),
                                                                          //   // Text(
                                                                          //   //   "$distance km",
                                                                          //   //   style: TextStyle(
                                                                          //   //       fontSize: MediaQuery.of(context).size.height * 0.018,
                                                                          //   //       fontFamily: 'SatoshiBold'),
                                                                          //   // ),
                                                                          // ])
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        width:MediaQuery.of(context).size.width*0.5,
                                                                        child: Text(
                                                                          order.cAddress,
                                                                          style: TextStyle(
                                                                              fontSize: 10, fontFamily: 'SatoshiMedium'),
                                                                          maxLines: 2,
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              width: double.infinity,
                                                              height: MediaQuery.of(context).size.height * 0.03,
                                                              padding: const EdgeInsets.symmetric(horizontal: 16),
                                                              color: const Color(0xfff8f8f8),
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: MediaQuery.of(context).size.width * 0.06,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Productdetailswidgets(vendorItems: order.vendorItems,),
                                                            // products(
                                                            //   data:order.vendorItems.toString(),
                                                            // ),
                                                            SizedBox(
                                                              height: MediaQuery.of(context).size.height * 0.03,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(context).size.height * 0.03,
                                                      ),
                                                      Column(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              print(countStatus);
                                                              // if (countStatus == 2)
                                                                showModalBottomSheet(
                                                                  context: context,
                                                                  isScrollControlled: true,
                                                                  builder: (BuildContext context) {
                                                                    return ChangeStatusSheet(
                                                                      orderID: order.orderId,
                                                                      statusCount: countStatus,
                                                                    ); // Replace YourBottomSheetWidget with your actual widget
                                                                  },
                                                                );
                                                            },
                                                            child: Container(
                                                              width: double.infinity,
                                                              height: MediaQuery.of(context).size.height * 0.08,
                                                              margin: const EdgeInsets.symmetric(horizontal: 16),
                                                              padding: const EdgeInsets.symmetric(horizontal: 16),
                                                              decoration: BoxDecoration(
                                                                  color: const Color(0xff29b2fe),
                                                                  borderRadius: BorderRadius.circular(6)),
                                                              child: Row(
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      SizedBox(
                                                                          height: MediaQuery.of(context).size.height *
                                                                              0.012),
                                                                      Text(
                                                                        "TOTAL",
                                                                        style: TextStyle(
                                                                            fontFamily: 'SatoshiMedium',
                                                                            fontSize:
                                                                            MediaQuery.of(context).size.height *
                                                                                0.02,
                                                                            color: Colors.white),
                                                                      ),
                                                                      Text(
                                                                        order.vendorTotalCost,
                                                                        style: TextStyle(
                                                                          fontFamily: 'SatoshiMedium',
                                                                          color: Colors.white,
                                                                          fontSize:
                                                                          MediaQuery.of(context).size.height * 0.02,
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  const Expanded(child: SizedBox()),
                                                                  Text(
                                                                    countStatus ==3
                                                                        ? 'Order yet to Arrive'
                                                                        : "Change Status",
                                                                    style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize:
                                                                        MediaQuery.of(context).size.height * 0.024,
                                                                        fontFamily: 'SatoshiMedium'),
                                                                  ),
                                                                  SizedBox(
                                                                      width: MediaQuery.of(context).size.width * 0.02),
                                                                  const Icon(Icons.arrow_right, color: Colors.white)
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: MediaQuery.of(context).size.height * 0.03,
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ));
                                            },
                                          );
                                        },
                                        child: Container(
                                          width:
                                          MediaQuery.of(context).size.width *
                                              0.9,
                                          height:
                                          MediaQuery.of(context).size.height *
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
                    })

                )
                :
                    Expanded(
                      child: ListView.builder(
                          itemCount: state.filterOrderlist.length,
                          itemBuilder: (context,index){
                            var order=state.filterOrderlist[index];
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
                                    order.createdAt.toString(),
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
                                      height:
                                      MediaQuery.of(context).size.height * 0.06,
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.03,
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                          ),
                                          Text(
                                            'Order ID : ${order.orderId}',
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'SatoshiBold'),
                                          ),
                                          const Expanded(child: SizedBox()),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                      MediaQuery.of(context).size.height * 0.01,
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            width:
                                            MediaQuery.of(context).size.width *
                                                0.045,
                                            height:
                                            MediaQuery.of(context).size.height *
                                                0.035,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xff29b2fe)),
                                            child: Center(
                                              child: Icon(
                                                Icons.home,
                                                color: Colors.white,
                                                size: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.03,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                          ),
                                          Container(
                                            width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                            child: Text(
                                              '${order.cAddress}',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'SatoshiBold'),
                                            ),
                                          ),
                                          const Expanded(child: SizedBox()),
                                          Text(
                                            order.pickupTime,
                                            style: const TextStyle(
                                                color: Color(0xff29b2fe),
                                                fontSize: 12,
                                                fontFamily: 'SatoshiBold'),
                                          )
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
                                      height:
                                      MediaQuery.of(context).size.height * 0.01,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                      0.006,
                                                ),
                                                Text(
                                                  '${order.pickupDate} | ${order.pickupTime}',
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
                                            color: const Color.fromARGB(
                                                255, 195, 195, 195),
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
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                      0.006,
                                                ),
                                                Text(
                                                  '${order.deliveryDate} | ${order.deliveryTime}',
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
                                      height:
                                      MediaQuery.of(context).size.height * 0.02,
                                    ),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.center,
                                    //   children: [
                                    //     GestureDetector(
                                    //       onTap: () {
                                    //         // Call the function to open the bottom-up modal
                                    //         orderSummary2(
                                    //             context, OrderRequest[index]);
                                    //       },
                                    //       child: Container(
                                    //         width:
                                    //             MediaQuery.of(context).size.width *
                                    //                 0.9,
                                    //         height:
                                    //             MediaQuery.of(context).size.height *
                                    //                 0.045,
                                    //         decoration: const BoxDecoration(
                                    //           borderRadius: BorderRadius.only(
                                    //             bottomLeft: Radius.circular(10),
                                    //             bottomRight: Radius.circular(10),
                                    //           ),
                                    //           color: Color(0xff29b2fe),
                                    //         ),
                                    //         child: Center(
                                    //           child: Text(
                                    //             // AppLocalizations.of(context)!.acceptorder,
                                    //             "VIEW ORDER",
                                    //             style: const TextStyle(
                                    //               color: Colors.white,
                                    //               fontSize: 13,
                                    //               fontFamily: 'SatoshiBold',
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    )

                          ],
            ),
          );
            },
          ),
          BlocBuilder<OrdersBloc,OrdersState>(builder: (context,state){
            if(state.orderStatus==OrderStatus.loading){
              return Center(
                child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 1,),
              );
            }
            else{
              return Container();
            }
          })
        ],
      ),
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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
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
          print("length : ${anything.length}");
          setState(() {
            statuscount = anything.length;
          });
          return anything.length < 6
              ? Padding(
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
                              height:
                                  MediaQuery.of(context).size.height * 0.06,
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width *
                                        0.03,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width *
                                            0.02,
                                  ),
                                  Text(
                                    'Order ID : ${OrderRequest[index]['OrderID']}',
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'SatoshiBold'),
                                  ),
                                  const Expanded(child: SizedBox()),
                                ],
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01,
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
                              child: Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width *
                                            0.045,
                                    height:
                                        MediaQuery.of(context).size.height *
                                            0.035,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff29b2fe)),
                                    child: Center(
                                      child: Icon(
                                        Icons.home,
                                        color: Colors.white,
                                        size: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.03,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width *
                                            0.02,
                                  ),
                                  Text(
                                    '${OrderRequest[index]["Caddress"].substring(0, 25)}...',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'SatoshiBold'),
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
                              padding:
                                  EdgeInsets.symmetric(horizontal: 12.0),
                              child: Divider(
                                color: Color.fromARGB(255, 212, 212, 212),
                                thickness: 0.7,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
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
                                    color: const Color.fromARGB(
                                        255, 195, 195, 195),
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
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
                              height:
                                  MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // Call the function to open the bottom-up modal
                                    // orderSummary(
                                    //     context, OrderRequest[index]);

                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width *
                                            0.9,
                                    height:
                                        MediaQuery.of(context).size.height *
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
                )
              : Container();
        }),
      ),
    );
  }
}

class previousOrderss extends StatefulWidget {
  const previousOrderss({super.key});

  @override
  State<previousOrderss> createState() => _previousOrderssState();
}

class _previousOrderssState extends State<previousOrderss> {
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
              print("length : ${anything.length}");
              setState(() {
                statuscount = anything.length;
              });
              return anything.length >= 6
                  ? Padding(
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.03,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      Text(
                                        'Order ID : ${OrderRequest[index]['OrderID']}',
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'SatoshiBold'),
                                      ),
                                      const Expanded(child: SizedBox()),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.045,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.035,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff29b2fe)),
                                        child: Center(
                                          child: Icon(
                                            Icons.home,
                                            color: Colors.white,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      Text(
                                        '${OrderRequest[index]["Caddress"].substring(0, 25)}...',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'SatoshiBold'),
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Divider(
                                    color: Color.fromARGB(255, 212, 212, 212),
                                    thickness: 0.7,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
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
                                        color: const Color.fromARGB(
                                            255, 195, 195, 195),
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
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     GestureDetector(
                                //       onTap: () {
                                //         // Call the function to open the bottom-up modal
                                //         orderSummary2(
                                //             context, OrderRequest[index]);
                                //       },
                                //       child: Container(
                                //         width:
                                //             MediaQuery.of(context).size.width *
                                //                 0.9,
                                //         height:
                                //             MediaQuery.of(context).size.height *
                                //                 0.045,
                                //         decoration: const BoxDecoration(
                                //           borderRadius: BorderRadius.only(
                                //             bottomLeft: Radius.circular(10),
                                //             bottomRight: Radius.circular(10),
                                //           ),
                                //           color: Color(0xff29b2fe),
                                //         ),
                                //         child: Center(
                                //           child: Text(
                                //             // AppLocalizations.of(context)!.acceptorder,
                                //             "VIEW ORDER",
                                //             style: const TextStyle(
                                //               color: Colors.white,
                                //               fontSize: 13,
                                //               fontFamily: 'SatoshiBold',
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container();
            }),
          ),
        ),
      ),
    );
  }
}
