import 'package:flutter/material.dart';

class DailyEarnings extends StatefulWidget {
  const DailyEarnings({Key? key}) : super(key: key);

  @override
  State<DailyEarnings> createState() => _DailyEarningsState();
}

class _DailyEarningsState extends State<DailyEarnings> {
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded( // Wrap with Expanded widget
          child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (BuildContext context, int index) {
              // Get the order status
              String status = orders[index]['status'];
              String time = orders[index]['time'];
              // Define color based on status
              Color color;
              Color textcolor = Colors.white;
              switch (status) {
                case 'Accepted':
                  color = const Color(0xFFE5F0FA);
                  textcolor = const Color(0xFF4B96DB);
                  break;
                case 'In Process':
                  color = const Color(0xFFFFECED);
                  textcolor = const Color(0xFFFF5357);
                  break;
                case 'On its way':
                  color = const Color(0xFFE9F7FF);
                  textcolor = const Color(0xFF3BB9FE);
                  break;
                case 'Delivered':
                  color = const Color(0xFFE5F5E8);
                  textcolor = const Color(0xFF40B452);
                  break;
                default:
                  color = Colors.grey;
              }
        
              return Container(
                height: 100, // Set your desired height here
                margin: const EdgeInsets.only(bottom: 21.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset:
                          const Offset(0, 0), // changes the position of the shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // SVG icon
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Icon(Icons.shopping_bag),
                      ),
                      const SizedBox(width: 20),
                      // Column with two texts
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order #${index + 1}',
                              style: const TextStyle(
                                fontSize: 1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              time,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      // Container with conditional color based on status
                      Container(
                        width: 100,
                        height: 27,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                              color: textcolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
