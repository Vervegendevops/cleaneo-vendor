import 'package:cleaneo_vendor/Home/OrderRequests/OrderReqDemoData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> _triggerApiCall() async {
  final String apiUrl =
      'https://drycleaneo.com/CleaneoVendor/api/updateOrderStatus/000000114';

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      // Add any required headers here
      // Add any required body parameters here
    );

    if (response.statusCode == 200) {
      // Successful API call
      print('API call successful');
    } else {
      // API call failed
      print('Failed with status code: ${response.statusCode}');
    }
  } catch (e) {
    // Exception occurred
    print('Exception: $e');
  }
}

class ChangeStatusSheet extends StatefulWidget {
  const ChangeStatusSheet({super.key});

  @override
  State<ChangeStatusSheet> createState() => _ChangeStatusSheetState();
}

Map<String, String> demoMap = {
  'status': 'p',
  'time': '23-oct-2023',
  'xyz': '23-oct-2023',
};

int mapLength = demoMap.length;

class _ChangeStatusSheetState extends State<ChangeStatusSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: IntrinsicHeight(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Your Order Status",
                style: TextStyle(
                  fontFamily: 'SatoshiBold',
                  fontSize: 22.0,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              const Text(
                "Update Your Order Status by Clicking Update Button.",
                style: TextStyle(
                    fontFamily: 'SatoshiBold',
                    fontSize: 12.0,
                    color: Colors.green),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 30,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    "Order Taken",
                    style: TextStyle(
                      fontFamily: 'SatoshiMedium',
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              //line 1
              Row(
                children: [
                  Transform.rotate(
                    angle: -90 *
                        3.1415926535 /
                        180, // Rotate 90 degrees clockwise (converted to radians)
                    child: Icon(
                      Icons.linear_scale,
                      size: 30,
                      color: statuscount >= 2 ? Colors.blue : Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  const Text(
                    "Order Taken",
                    style: TextStyle(
                        fontFamily: 'SatoshiMedium',
                        fontSize: 12.0,
                        color: Colors.grey),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    size: 30,
                    Icons.check_circle,
                    color: statuscount >= 2 ? Colors.blue : Colors.grey,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  const Text(
                    "Order Processing",
                    style: TextStyle(
                      fontFamily: 'SatoshiMedium',
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              //line 2
              Row(
                children: [
                  Transform.rotate(
                    angle: -90 *
                        3.1415926535 /
                        180, // Rotate 90 degrees clockwise (converted to radians)
                    child: Icon(
                      Icons.linear_scale,
                      size: 30,
                      color: statuscount >= 3 ? Colors.blue : Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  const Text(
                    "Order Taken",
                    style: TextStyle(
                        fontFamily: 'SatoshiMedium',
                        fontSize: 12.0,
                        color: Colors.grey),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    size: 30,
                    Icons.check_circle,
                    color: statuscount >= 3 ? Colors.blue : Colors.grey,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  const Text(
                    "Order Washing",
                    style: TextStyle(
                      fontFamily: 'SatoshiMedium',
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              //line 3
              Row(
                children: [
                  Transform.rotate(
                    angle: -90 *
                        3.1415926535 /
                        180, // Rotate 90 degrees clockwise (converted to radians)
                    child: Icon(
                      Icons.linear_scale,
                      size: 30,
                      color: statuscount >= 4 ? Colors.blue : Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  const Text(
                    "Order Taken",
                    style: TextStyle(
                        fontFamily: 'SatoshiMedium',
                        fontSize: 12.0,
                        color: Colors.grey),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    size: 30,
                    Icons.check_circle,
                    color: statuscount >= 4 ? Colors.blue : Colors.grey,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  const Text(
                    "Order Delivered",
                    style: TextStyle(
                      fontFamily: 'SatoshiMedium',
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4, // Set width
                height: MediaQuery.of(context).size.height * 0.05, // Set height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), // Add border radius
                ),
                child: ElevatedButton(
                  onPressed: () {
                    _triggerApiCall();
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.blue), // Set background color
                    shadowColor: MaterialStateProperty.all<Color>(
                        Colors.transparent), // Remove shadow
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Add border radius
                      ),
                    ),
                  ),
                  child: const Text(
                    "Update Status",
                    style: TextStyle(
                        fontFamily: 'SatoshiBold',
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
