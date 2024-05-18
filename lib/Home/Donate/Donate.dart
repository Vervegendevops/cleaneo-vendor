import 'package:cleaneo_vendor/Home/Drawer.dart';
import 'package:cleaneo_vendor/Home/Inventory%20Request/payment_page.dart';
import 'package:flutter/material.dart';

class Donate extends StatefulWidget {
  Donate({Key? key}) : super(key: key);

  @override
  State<Donate> createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff006acb),
        ),
        child: Column(
          children: [
            SizedBox(height: mQuery.size.height * 0.034),
            Padding(
              padding: EdgeInsets.only(
                  top: mQuery.size.height * 0.056,
                  left: mQuery.size.width * 0.045,
                  right: mQuery.size.width * 0.045,
                  bottom: mQuery.size.height * 0.036),
              child: GestureDetector(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: mQuery.size.height * 0.04,
                      ),
                    ),
                    SizedBox(
                      width: mQuery.size.width * 0.045,
                    ),
                    Text(
                      // "Donate",
                      "Impact",
                      style: TextStyle(
                          fontSize: mQuery.size.height * 0.027,
                          color: Colors.white,
                          fontFamily: 'SatoshiBold'),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: mQuery.size.height * 0.023,
                      ),
                      Text(
                        "Life of Laundryman",
                        style: TextStyle(
                            fontSize: mQuery.size.height * 0.023,
                            fontFamily: 'SatoshiMedium'),
                      ),
                      SizedBox(
                        height: mQuery.size.height * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "The Struggle of Laundrymen",
                                style: TextStyle(
                                    fontSize: mQuery.size.height * 0.016,
                                    fontFamily: 'SatoshiMedium'),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: mQuery.size.height * 0.01,
                          ),
                          Text(
                            "In every city, amidst the towering skyscrapers and busy streets, lies a silent workforce often overlooked—the laundrymen. These unsung heroes work tirelessly to clean and press our clothes, yet their struggles are rarely recognized. This essay explores the challenges they face, shedding light on their resilience and perseverance.",
                            style: TextStyle(
                                fontSize: mQuery.size.height * 0.0145,
                                fontFamily: 'SatoshiRegular'),
                          ),
                          SizedBox(
                            height: mQuery.size.height * 0.02,
                          ),
                          Text(
                            "Current Challenges:",
                            style: TextStyle(
                                fontSize: mQuery.size.height * 0.016,
                                fontFamily: 'SatoshiMedium'),
                          ),
                          SizedBox(
                            height: mQuery.size.height * 0.01,
                          ),
                          Text(
                            "In today's world, laundrymen grapple with a host of issues, from paltry wages to unstable work environments. Due to narrow profit margins, laundry facilities frequently implement cost-saving measures, resulting in inadequate compensation for workers. Additionally, the repetitive nature of their tasks can lead to physical ailments like musculoskeletal injuries and chronic pain, further exacerbating their challenges",
                            style: TextStyle(
                                fontSize: mQuery.size.height * 0.0145,
                                fontFamily: 'SatoshiRegular'),
                          ),
                          SizedBox(
                            height: mQuery.size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: mQuery.size.width * 0.3,
                                height: mQuery.size.height * 0.18,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Image.network(
                                    "https://i.pinimg.com/474x/21/a8/3c/21a83c30e5431f3c89d172fe268ba3cc.jpg"),
                              ),
                              Container(
                                width: mQuery.size.width * 0.3,
                                height: mQuery.size.height * 0.18,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Image.network(
                                    "https://cdn.pixabay.com/photo/2015/10/15/07/48/dhobi-989046_1280.jpg"),
                              ),
                              Container(
                                width: mQuery.size.width * 0.3,
                                height: mQuery.size.height * 0.18,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Image.network(
                                    "https://i.pinimg.com/474x/b4/0d/36/b40d36688bd2e4ae36742e39f905da08.jpg"),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: mQuery.size.height * 0.046,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _openDonateBottomSheet(context);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFF009C1A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          elevation: 0,
                          minimumSize: Size(400.0, 50.0),
                        ),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              fontSize: mQuery.size.height * 0.023,
                              fontFamily: 'SatoshiBold'),
                        ),
                      ),
                      SizedBox(height: mQuery.size.height * 0.02)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _openDonateBottomSheet(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            width: double.infinity,
            height: mQuery.size.height * 0.45,
            padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.04),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mQuery.size.height * 0.023,
                  ),
                  Text(
                    "Our efforts for donation",
                    style: TextStyle(
                        fontSize: mQuery.size.height * 0.023,
                        fontFamily: 'SatoshiBold'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: mQuery.size.width * 0.275,
                        height: mQuery.size.height * 0.18,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.network(
                            "https://thumbs.dreamstime.com/b/noida-uttar-pradesh-india-november-group-young-people-ngo-distributing-food-to-poor-children-slum-pandemic-giving-203881336.jpg"),
                      ),
                      Container(
                        width: mQuery.size.width * 0.275,
                        height: mQuery.size.height * 0.18,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.network(
                            "https://www.indiaspend.com/h-upload/old_images/1600x960_342945-charity1440.jpg"),
                      ),
                      Container(
                        width: mQuery.size.width * 0.275,
                        height: mQuery.size.height * 0.18,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.network(
                            "https://sc0.blr1.cdn.digitaloceanspaces.com/article/159247-xyzhgbnqzz-1621481357.jpg"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: mQuery.size.height * 0.026,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text("\"We make a living by what we get, but we make"),
                        Text("\a life by what we give\""),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mQuery.size.height * 0.026,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return PaymentPage();
                      }));
                    },
                    child: Container(
                      width: double.infinity,
                      height: mQuery.size.height * 0.065,
                      decoration: BoxDecoration(
                          color: Color(0xFF009C1A),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "Dontate",
                          style: TextStyle(
                              fontSize: mQuery.size.height * 0.023,
                              fontFamily: 'SatoshiBold',
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
