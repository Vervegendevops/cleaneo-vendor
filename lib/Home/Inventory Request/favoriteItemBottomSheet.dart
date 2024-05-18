import 'package:cleaneo_vendor/Home/Inventory%20Request/addToCartBottomSheet.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> activatedFavorites = [];

void favoriteItemsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      var mQuery = MediaQuery.of(context);

      if (activatedFavorites.isEmpty) {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "No Favorite items here",
                  style: TextStyle(fontSize: mQuery.size.height * 0.023, color: Colors.grey,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        );
      }

      // If there are favorite items, render the ListView.builder
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
            SizedBox(height: mQuery.size.height * 0.03),
            Text(
              "Your Favorite Items",
              style: TextStyle(fontSize: mQuery.size.height * 0.02,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: mQuery.size.height * 0.02),
            Expanded(
              child: ListView.builder(
                itemCount: activatedFavorites.length,
                itemBuilder: (context, index) {
                  return Container(
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
                          title: Text(
                            activatedFavorites[index]['name'],
                            style: TextStyle(fontSize: mQuery.size.height * 0.017),
                          ),
                          subtitle: Text(
                            activatedFavorites[index]['weight'],
                            style: TextStyle(fontSize: mQuery.size.height * 0.015),
                          ),
                          trailing: Text('₹${activatedFavorites[index]['price']}'),
                        ),
                        GestureDetector(
                          onTap : ()
                          {
                            addToCartBottomSheet(context);
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
                              child: Text("Add to Cart",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: mQuery.size.height*0.012
                              ),),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}