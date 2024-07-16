import 'dart:convert';

import 'package:intl/intl.dart';

import '../model/order_data.dart';

class ConvertFunction{
  static double applyDiscount(String discount, double totalAmount) {
    double discountPercentage = double.parse(discount.replaceAll('%', ''));

    double discountAmount = totalAmount * (discountPercentage / 100);

    double finalAmount = totalAmount - discountAmount;

    return finalAmount;
  }
  static double removeDiscount(String discount, double totalAmount) {
    double discountPercentage = double.parse(discount.replaceAll('%', ''));

    double discountAmount = totalAmount * (discountPercentage / 100);

    double finalAmount = totalAmount + discountAmount;

    return finalAmount;


  }
  static double discount(String discount, double totalAmount) {
    double discountPercentage = double.parse(discount.replaceAll('%', ''));

    double discountAmount = totalAmount * (discountPercentage / 100);


    return discountAmount;
  }

  String extractNotificationText(String notificationMessage) {
    int endIndex = notificationMessage.indexOf(" has been updated");
    if (endIndex != -1) {
      return notificationMessage.substring(0, endIndex + " has been updated".length);
    } else {
      return notificationMessage;
    }
  }
  static String getTime(String date){

    DateTime dateTime = DateTime.parse(date);

    String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }
  static String getDate(String date){

    DateTime dateTime = DateTime.parse(date);

    String datee = DateFormat('yyyy-MM-dd').format(dateTime);
    return datee;
  }
  List<Item> parseVendorItems(String vendorItems) {
    if (vendorItems.isEmpty) {
      return [];
    }

    try {
      // Step 1: Decode the JSON string to convert it into a valid JSON string
      String decodedString = jsonDecode(vendorItems);

      // Step 2: Decode the valid JSON string into a list of dynamic objects
      List<dynamic> jsonList = jsonDecode(decodedString);

      // Step 3: Convert the list of dynamic objects into a list of Item objects
      List<Item> items = jsonList.map((json) => Item.fromJson(json)).toList();

      return items;
    } catch (e) {
      print('Error parsing VendorItems: $e');
      return [];
    }
  }

}