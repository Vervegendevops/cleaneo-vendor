import 'package:cleaneo_vendor/Home/Inventory%20Request/payment_page.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> activatedFavorites = [];

void addToCartBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      var mQuery = MediaQuery.of(context);

      // Adding itemNo to each item in activatedFavorites
      for (int i = 0; i < activatedFavorites.length; i++) {
        activatedFavorites[i]['itemNo'] = i + 1; // Assuming itemNo starts from 1
      }

      return Container(
        height: mQuery.size.height * 0.8,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: mQuery.size.height * 0.02),
            activatedFavorites.isNotEmpty
                ? Text(
              "Added items are",
              style: TextStyle(fontSize: mQuery.size.height * 0.02,
                  fontWeight: FontWeight.w700),
            )
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: mQuery.size.height*0.32,),
                Center(
                  child: Text(
                    "No Items Added",
                    style: TextStyle(
                      fontSize: mQuery.size.height * 0.023,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: mQuery.size.height * 0.02),
            activatedFavorites.isNotEmpty
                ? Expanded(
              child: ListView.builder(
                itemCount: activatedFavorites.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: mQuery.size.height * 0.02),
                      Container(
                        margin: EdgeInsets.only(bottom: mQuery.size.height * 0.02),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: Image.network(
                                activatedFavorites[index]['image'],
                                width: mQuery.size.width * 0.14,
                                height: mQuery.size.height * 0.06,
                                fit: BoxFit.cover,
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    activatedFavorites[index]['name'],
                                    style: TextStyle(fontSize: mQuery.size.height * 0.017),
                                  ),
                                  Text(
                                    activatedFavorites[index]['weight'],
                                    style: TextStyle(fontSize: mQuery.size.height * 0.015),
                                  ),
                                  Text(
                                    'Item No: ${activatedFavorites[index]['itemNo']}',
                                    style: TextStyle(fontSize: mQuery.size.height * 0.015),
                                  ),
                                ],
                              ),
                              trailing: Text('₹${activatedFavorites[index]['price']}'),
                            ),
                            GestureDetector(
                              onTap : ()
                              {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                  return PaymentPage();
                                }));
                              },
                              child: Container(
                                width: mQuery.size.width * 0.17,
                                height: mQuery.size.height * 0.024,
                                decoration: BoxDecoration(
                                  color: Color(0xff3d8b15),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                margin : EdgeInsets.only(
                                    left: mQuery.size.width*0.045,
                                    bottom: mQuery.size.height*0.01
                                ),
                                child: Center(
                                  child: Text("Buy Now",style: TextStyle(
                                      color: Colors.white,
                                      fontSize: mQuery.size.height*0.012
                                  ),),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
                : SizedBox.shrink(), // Hides the ListView.builder if activatedFavorites is empty
          ],
        ),
      );
    },
  );
}