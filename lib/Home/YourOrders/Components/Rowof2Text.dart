import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class YourOrders2Text extends StatefulWidget {
  const YourOrders2Text({Key? key}) : super(key: key);

  @override
  _YourOrders2TextState createState() => _YourOrders2TextState();
}

class _YourOrders2TextState extends State<YourOrders2Text> {
  int _selectedIndex = 0;
  final List<String> _tabNames = ['Ongoing', 'Previous'];

  @override
  Widget build(BuildContext context) {
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
                    width: mQuery.size.width * 0.47,
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
        const SizedBox(height: 20),
        // Content based on tab selection
        if (_selectedIndex == 0)
          Expanded(
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
          ),
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
                                height: mQuery.size.height * 0.02,
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
                                              size: mQuery.size.width * 0.047,
                                              color: const Color(0xff29b2fe),
                                            ),
                                            SizedBox(
                                              width: mQuery.size.width * 0.01,
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
