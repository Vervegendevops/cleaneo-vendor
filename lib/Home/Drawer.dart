import 'package:cleaneo_vendor/Home/BotNav.dart';
import 'package:cleaneo_vendor/Home/CashCollected/CashCollected.dart';
import 'package:cleaneo_vendor/Home/Earnings/MyEarnings.dart';
import 'package:cleaneo_vendor/Home/EditProfile/MyProfile.dart';
import 'package:cleaneo_vendor/Home/Help/Help.dart';
import 'package:cleaneo_vendor/Home/Ledger/Ledger.dart';
import 'package:cleaneo_vendor/Home/Notifications/Notifications.dart';
import 'package:cleaneo_vendor/Home/OrderRequests/OrderRequests.dart';
import 'package:cleaneo_vendor/Home/OrderStatus/OrderStatus.dart';
import 'package:cleaneo_vendor/Home/Training%20Modules/training_modules_page.dart';
import 'package:cleaneo_vendor/Home/YourOrders/YourOrders.dart';
import 'package:cleaneo_vendor/Home/Inventory%20Request/inventory_request_page.dart';
import 'package:cleaneo_vendor/Screens/Welcome/WelcomePage.dart';
import 'package:cleaneo_vendor/Screens/join_us_screen.dart';
import 'package:cleaneo_vendor/main.dart';
import 'package:cleaneo_vendor/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:provider/provider.dart';

import '../bloc/home/home_bloc.dart';
import '../bloc/home/home_event.dart';
import '../bloc/notification/notification_bloc.dart';
import '../bloc/notification/notification_event.dart';
import '../bloc/orders_bloc.dart';
import '../bloc/orders_event.dart';
import '../notification/notification_page.dart';
import 'Earnings/Components/RowofThreeText.dart';
import 'YourOrders/Components/Rowof2Text.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    var versionNo = 1.1;
    var pm = "Narendra Modi";
    var mobileNo = "(+91) 9978997899";
    return Drawer(
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyProfilePage();
                }));
              },
              child: Container(
                width: double.infinity,
                color: const Color(0xfff3fbff),
                height: mQuery.size.height * 0.15,
                child: Column(
                  children: [
                    SizedBox(height: mQuery.size.height * 0.058),
                    GestureDetector(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const ProfilePicture(
                                name: "",
                                radius: 20,
                                fontsize: 10,
                                img:
                                    "https://media.licdn.com/dms/image/C4D03AQHHSwZyheu1UQ/profile-displayphoto-shrink_800_800/0/1662703260529?e=2147483647&v=beta&t=Jm4eBGPY71_8duu5EDtQrXPoUY9yMY-QcRh5OiTztEk",
                              ),
                              SizedBox(
                                width: mQuery.size.width * 0.024,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (context) {
                                  //   return MyProfilePage();
                                  // }));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: mQuery.size.height * 0.02,
                                        ),
                                        Text(
                                          "${UserLoggedIn.read('Name')}",
                                          style: TextStyle(
                                              fontSize:
                                                  mQuery.size.height * 0.02,
                                              fontFamily: 'SatoshiBold'),
                                        ),
                                        SizedBox(
                                          width: mQuery.size.width * 0.2,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            // Navigator.push(context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) {
                                            //   return MyProfilePage();
                                            // }));
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                right: 20.0),
                                            child: Image.asset(
                                                "assets/images/drawer-images/edit.png",
                                                color: const Color(0xff29b2fe),
                                                width:
                                                    mQuery.size.width * 0.04),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.phone_android,
                                          size: mQuery.size.width * 0.04,
                                        ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          "+91 ${UserLoggedIn.read('Phone')}",
                                          style: TextStyle(
                                            fontFamily: 'SatoshiRegular',
                                            fontSize:
                                                mQuery.size.height * 0.015,
                                          ),
                                        ),
                                        SizedBox(
                                          width: mQuery.size.width * 0.02,
                                        ),
                                        Container(
                                          width: mQuery.size.width * 0.03,
                                          height: mQuery.size.height * 0.03,
                                          decoration: const BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 10,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return BotNav(
                                  indexx: 0,
                                );
                              }));
                            },
                            child: ListTile(
                              leading: Image.asset(
                                  "assets/images/drawer-images/dashboard.png",
                                  color: const Color(0xff29b2fe),
                                  width: mQuery.size.width * 0.065),
                              title: Text(
                                "Dashboard",
                                style: TextStyle(
                                  fontFamily: 'SatoshiBold',
                                  fontSize: mQuery.size.height * 0.021,
                                ),
                              ),
                            )),
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(context,
                        //         MaterialPageRoute(builder: (context) {
                        //       return const OrderReq();
                        //     }));
                        //   },
                        //   child: ListTile(
                        //     leading: Image.asset(
                        //         "assets/images/drawer-images/shopping-bag.png",
                        //         color: const Color(0xff29b2fe),
                        //         width: mQuery.size.width * 0.06),
                        //     title: Text(
                        //       "Order Requests",
                        //       style: TextStyle(
                        //         fontFamily: 'SatoshiBold',
                        //         fontSize: mQuery.size.height * 0.021,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(context,
                        //         MaterialPageRoute(builder: (context) {
                        //       return OrderStatus();
                        //     }));
                        //   },
                        //   child: ListTile(
                        //     leading: Image.asset(
                        //         "assets/images/drawer-images/location_icon.png",
                        //         color: const Color(0xff29b2fe),
                        //         width: mQuery.size.width * 0.06),
                        //     title: Text(
                        //       "Order Status",
                        //       style: TextStyle(
                        //         fontFamily: 'SatoshiBold',
                        //         fontSize: mQuery.size.height * 0.021,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return  BlocProvider(
                                create: (context) => OrdersBloc()..add(GetOrderEvent())..add(GetPreviousOrderEvent()),
                                child: YourOrders2Text(),
                              );
                            }));
                          },
                          child: ListTile(
                            leading: Image.asset(
                                "assets/images/drawer-images/shopping-bag.png",
                                color: const Color(0xff29b2fe),
                                width: mQuery.size.width * 0.06),
                            title: Text(
                              "Your Orders",
                              style: TextStyle(
                                fontFamily: 'SatoshiBold',
                                fontSize: mQuery.size.height * 0.021,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return  BlocProvider(
                                create: (context) => NotificationBloc()..add(GetNotificationEvent()),
                                child: NotificationsPage(),
                              );
                            }));
                          },
                          child: ListTile(
                            leading: Image.asset(
                                "assets/images/drawer-images/location_icon.png",
                                color: const Color(0xff29b2fe),
                                width: mQuery.size.width * 0.06),
                            title: Text(
                              "Notifications",
                              style: TextStyle(
                                fontFamily: 'SatoshiBold',
                                fontSize: mQuery.size.height * 0.021,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return  BlocProvider(
                                create: (context) => HomeBloc()..add(GetEarningsEvent()),
                                child: NavigationWithTabs(),
                              );
                            }));
                          },
                          child: ListTile(
                            leading: Image.asset(
                                "assets/images/drawer-images/credit-card.png",
                                color: const Color(0xff29b2fe),
                                width: mQuery.size.width * 0.06),
                            title: Text(
                              "My Earnings",
                              style: TextStyle(
                                fontFamily: 'SatoshiBold',
                                fontSize: mQuery.size.height * 0.021,
                              ),
                            ),
                          ),
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(context,
                        //         MaterialPageRoute(builder: (context) {
                        //       return CashCollected();
                        //     }));
                        //   },
                        //   child: ListTile(
                        //     leading: Image.asset(
                        //         "assets/images/drawer-images/offers.png",
                        //         color: const Color(0xff29b2fe),
                        //         width: mQuery.size.width * 0.06),
                        //     title: Text(
                        //       "Cash Collected",
                        //       style: TextStyle(
                        //         fontWeight: FontWeight.w600,
                        //         fontSize: mQuery.size.height * 0.0212,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Ledger();
                            }));
                          },
                          child: ListTile(
                            leading: Image.asset(
                                "assets/images/drawer-images/gift.png",
                                color: const Color(0xff29b2fe),
                                width: mQuery.size.width * 0.06),
                            title: Text(
                              "Ledger",
                              style: TextStyle(
                                fontFamily: 'SatoshiBold',
                                fontSize: mQuery.size.height * 0.021,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return InventoryRequestPage();
                            }));
                          },
                          child: ListTile(
                            leading: Image.asset(
                                "assets/images/drawer-images/help.png",
                                color: const Color(0xff29b2fe),
                                width: mQuery.size.width * 0.06),
                            title: Text(
                              "Inventory Request",
                              style: TextStyle(
                                fontFamily: 'SatoshiBold',
                                fontSize: mQuery.size.height * 0.021,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Trainings();
                            }));
                          },
                          child: ListTile(
                            leading: Image.asset(
                                "assets/images/drawer-images/help.png",
                                color: const Color(0xff29b2fe),
                                width: mQuery.size.width * 0.06),
                            title: Text(
                              "Training Modules",
                              style: TextStyle(
                                fontFamily: 'SatoshiBold',
                                fontSize: mQuery.size.height * 0.021,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CustomerServicePage();
                            }));
                          },
                          child: ListTile(
                            leading: Image.asset(
                                "assets/images/drawer-images/help.png",
                                color: const Color(0xff29b2fe),
                                width: mQuery.size.width * 0.06),
                            title: Text(
                              "Help",
                              style: TextStyle(
                                fontFamily: 'SatoshiBold',
                                fontSize: mQuery.size.height * 0.021,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: mQuery.size.height * 0.02),
              color: Colors.white,
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>JoinUsScreen()));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: mQuery.size.width * 0.045),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff29B2FE),
                            borderRadius: BorderRadius.circular(8)),
                        width: double.infinity,
                        height: mQuery.size.height * 0.04,
                        child: Center(
                          child: Text(
                            "Join us as a partner",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: mQuery.size.height * 0.02,
                                fontFamily: 'SatoshiBold'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                        horizontal: mQuery.size.width * 0.045),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await LocalStorage.saveRegisteration("");
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return WelcomePage();
                                    }));
                                  },
                                  child: Text(
                                    "Sign Out",
                                    style: TextStyle(
                                        fontSize: mQuery.size.height * 0.022,
                                        color: Colors.black,
                                        fontFamily: 'SatoshiBold'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mQuery.size.height * 0.0075,
                        ),
                        Text(
                          "CLEANEO V$versionNo",
                          style: TextStyle(
                              fontSize: mQuery.size.height * 0.015,
                              fontFamily: 'SatoshiMedium'),
                        ),
                        SizedBox(
                          height: mQuery.size.height * 0.01,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
