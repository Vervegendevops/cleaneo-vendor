import 'package:cleaneo_vendor/Home/CashCollected/CashCollected.dart';
import 'package:cleaneo_vendor/Home/Drawer.dart';
import 'package:cleaneo_vendor/Home/Earnings/MyEarnings.dart';
import 'package:cleaneo_vendor/Home/EditProfile/MyProfile.dart';
import 'package:cleaneo_vendor/Home/Inventory%20Request/inventory_request_page.dart';
import 'package:cleaneo_vendor/Home/Ledger/Ledger.dart';
import 'package:cleaneo_vendor/Home/OrderRequests/OrderRequests.dart';
import 'package:cleaneo_vendor/Home/OrderStatus/OrderStatus.dart';
import 'package:cleaneo_vendor/Home/Training%20Modules/training_modules_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_switch/flutter_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var orderNo = 3;
  int selectedContainerIndex = -1;

  TextEditingController searchController = TextEditingController();

  final List<Widget> _pages = [
    const OrderReq(),
    const OrderStatus(),
    const MyEarnings(),
    const CashCollected(),
    const OrderReq(),
    const Ledger(),
  ];
  List<Map<String, dynamic>> gridItems = [
    {
      "image": "assets/images/Home/Order Requests.png",
      "text": "Order Requests",
    },
    {
      "image": "assets/images/Home/Order Status.png",
      "text": "Order Status",
    },
    {
      "image": "assets/images/Home/My Earnings.png",
      "text": "My Earnings",
    },
    {
      "image": "assets/images/Home/Cash Collected.png",
      "text": "Cash Collected",
    },
    {
      "image": "assets/images/Home/Delivery Partner Management.png",
      "text": "Manage Delivery",
    },
    {
      "image": "assets/images/Home/Cash Collected.png",
      "text": "Ledger",
    },
  ];
  bool status = false;
  List<String> dealImages = [
    "https://img.freepik.com/premium-vector/super-deal-text-effect-editable-3d-text-style-suitable-banner-promotion_16148-1552.jpg",
    "https://cdn.vectorstock.com/i/preview-1x/10/75/amazing-deals-sign-over-colorful-cut-out-foil-vector-48291075.jpg",
    // Add more image filenames as needed
  ];

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);

    return Scaffold(
      drawer: const MyDrawer(),
      body: Container(
        color: const Color(0xfff3fbff),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 26),
              width: double.infinity,
              height: mQuery.size.height * 0.32,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/Home/splash.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Row(
                      children: [
                        Builder(
                          builder: (BuildContext context) {
                            return IconButton(
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                              icon: const Icon(
                                Icons.menu,
                                size: 30,
                              ),
                              color: Colors.white,
                            );
                          },
                        ),
                        SvgPicture.asset(
                          "assets/images/Home/mainlogo.svg",
                          width: 30,
                          height: 23,
                        ),
                        const Expanded(child: SizedBox()),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MyProfilePage();
                                },
                              ),
                            );
                          },
                          child: const ProfilePicture(
                            name: "",
                            radius: 18,
                            fontsize: 10,
                            img: "https://media.licdn.com/dms/image/C4D03AQHHSwZyheu1UQ/profile-displayphoto-shrink_800_800/0/1662703260529?e=2147483647&v=beta&t=Jm4eBGPY71_8duu5EDtQrXPoUY9yMY-QcRh5OiTztEk",
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: mQuery.size.height * 0.03,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.welcomeback,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: 'SatoshiBold'
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Narendra",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SatoshiBold',
                            fontSize: mQuery.size.height * 0.018,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              status ? 'Online' : 'Offline',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                fontFamily: 'SatoshiMedium'
                              ),
                            ),
                            SizedBox(width: mQuery.size.width*0.012,),
                            Transform.scale(
                              scale: 0.75,
                              child: Switch(
                                value: status,
                                activeTrackColor: Colors.white,
                                onChanged: (newValue) {
                                  setState(() {
                                    status = newValue;
                                  });
                                },
                                thumbColor: MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                    // Set thumb color to green when switch is active (on)
                                    if (states.contains(MaterialState.selected)) {
                                      return Colors.green;
                                    }
                                    // Return null to use default color for other states
                                    return null;
                                  },
                                ),
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                  // SizedBox(height: mQuery.size.height * 0.02),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    height: mQuery.size.height * 0.055,
                    padding: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextField(
                      cursorColor: Colors.grey,
                      controller: searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: AppLocalizations.of(context)!.search,
                        hintStyle: TextStyle(
                          fontSize: mQuery.size.height * 0.02,
                          color: const Color.fromARGB(255, 179, 179, 179),
                          fontFamily: 'SatoshiMedium'
                        ),
                        suffixIcon: const Icon(Icons.search,
                            color: Color.fromARGB(255, 179, 179, 179)),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       GestureDetector(
                         onTap : ()
                         {
                           Navigator.push(context, MaterialPageRoute(builder: (context){
                             return OrderReq();
                           }));
                         },
                         child: Container(
                           width: mQuery.size.width*0.4,
                           height: mQuery.size.height*0.14,
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(12),
                             boxShadow: [
                               BoxShadow(
                                 color: Colors.grey.withOpacity(0.5),
                                 spreadRadius: 0,
                                 blurRadius: 7,
                                 offset: Offset(0,0)
                               )
                             ]
                           ),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Image.asset("assets/images/Home/Order Requests.png",
                                width: mQuery.size.width*0.16,),
                               SizedBox(height: mQuery.size.height*0.006),
                               Text("Order Request",style: TextStyle(
                                 fontSize: mQuery.size.height*0.015,
                                 fontFamily: 'SatoshiMedium'
                               ),)
                             ],
                           ),
                         ),
                       ),
                       GestureDetector(
                         onTap : ()
                         {
                           Navigator.push(context, MaterialPageRoute(builder: (context){
                             return OrderStatus();
                           }));
                         },
                         child: Container(
                           width: mQuery.size.width*0.4,
                           height: mQuery.size.height*0.14,
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(12),
                             boxShadow: [
                               BoxShadow(
                                 color: Colors.grey.withOpacity(0.5),
                                 spreadRadius: 0,
                                 blurRadius: 7,
                                 offset: Offset(0,0)
                               )
                             ]
                           ),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Image.asset("assets/images/Home/Order Status.png",
                                width: mQuery.size.width*0.1,
                                ),
                               SizedBox(height: mQuery.size.height*0.006),
                               Text("Order Status",style: TextStyle(
                                   fontFamily: 'SatoshiMedium',
                                 fontSize: mQuery.size.height*0.015
                               ),)
                             ],
                           ),
                         ),
                       ),
                      ],
                    ),
                  ),
                  SizedBox(height: mQuery.size.height*0.038,),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap : ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return MyEarnings();
                            }));
                          },
                          child: Container(
                            width: mQuery.size.width*0.4,
                            height: mQuery.size.height*0.14,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 7,
                                      offset: Offset(0,0)
                                  )
                                ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/Home/My Earnings.png",
                                  width: mQuery.size.width*0.11,),
                                SizedBox(height: mQuery.size.height*0.006),
                                Text("My Earnings",style: TextStyle(
                                    fontFamily: 'SatoshiMedium',
                                    fontSize: mQuery.size.height*0.015
                                ),)
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap : ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return Ledger();
                            }));
                          },
                          child: Container(
                            width: mQuery.size.width*0.4,
                            height: mQuery.size.height*0.14,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 7,
                                      offset: Offset(0,0)
                                  )
                                ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/Home/Cash Collected.png",
                                  width: mQuery.size.width*0.12,
                                ),
                                SizedBox(height: mQuery.size.height*0.006),
                                Text("Ledger",style: TextStyle(
                                    fontFamily: 'SatoshiMedium',
                                    fontSize: mQuery.size.height*0.015
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: mQuery.size.height*0.038,),


                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap : ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const InventoryRequestPage();
                            }));
                          },
                          child: Container(
                            width: mQuery.size.width*0.4,
                            height: mQuery.size.height*0.14,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 7,
                                      offset: Offset(0,0)
                                  )
                                ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/Home/Delivery Partner Management.png",
                                  width: mQuery.size.width*0.12,),
                                SizedBox(height: mQuery.size.height*0.006),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Inventory\n Request",style: TextStyle(
                                        fontSize: mQuery.size.height*0.015,
                                      fontFamily: 'SatoshiMedium',
                                    ),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap : ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return Trainings();
                            }));
                          },
                          child: Container(
                            width: mQuery.size.width*0.4,
                            height: mQuery.size.height*0.14,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 7,
                                      offset: Offset(0,0)
                                  )
                                ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/Home/Cash Collected.png",
                                  width: mQuery.size.width*0.12,
                                ),
                                SizedBox(height: mQuery.size.height*0.006),
                                Text("Training Modules",style: TextStyle(
                                    fontFamily: 'SatoshiMedium',
                                    fontSize: mQuery.size.height*0.015
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // drawer: const MyDrawer(),
    );
  }
}