import 'package:flutter/material.dart';

import '../model/order_data.dart';

class Productdetailswidgets extends StatefulWidget {
  List<Item> vendorItems;
   Productdetailswidgets({super.key,required this.vendorItems});

  @override
  State<Productdetailswidgets> createState() => _ProductdetailswidgetsState();
}

class _ProductdetailswidgetsState extends State<Productdetailswidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: ListView.separated(
        itemCount: widget.vendorItems.length,
        separatorBuilder: (BuildContext context, int index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(),
        ),
        itemBuilder: (BuildContext context, int index) {
          var data=widget.vendorItems[index];
          int TotalPrice = (widget.vendorItems[index].quantity) *
              int.parse(widget.vendorItems[index].price);
          print(TotalPrice);
          return Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "${data.quantity} x ${data.name} (${data.type})",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.017,
                          fontFamily: 'SatoshiMedium',
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.003),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.02),
                    child: Row(
                      children: [
                        Text(
                          "₹ ${data.price}  PER PIECE",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize:
                            MediaQuery.of(context).size.height * 0.017,
                            fontFamily: 'SatoshiMedium',
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          "₹ $TotalPrice",
                          style: TextStyle(
                            fontSize:
                            MediaQuery.of(context).size.height * 0.017,
                            fontFamily: 'SatoshiMedium',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.016),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
