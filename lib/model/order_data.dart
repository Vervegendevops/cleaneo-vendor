import 'dart:convert';

import 'package:cleaneo_vendor/utils/convert_function.dart';

class Order {
  int sno;
  String orderId;
  String userId;
  String vendorId;
  // String vendorAddress;
  // String vendorLatitude;
  // String vendorLongitude;
  List<Item> items;
  List<Item> vendorItems;
  String pickupDate;
  String pickupTime;
  String deliveryDate;
  String deliveryTime;
   String floor;
   String cAddress;
   String htReach;
  // String userLatitude;
  // String userLongitude;
  // String extraNote;
  // String supportYourRider;
  // String deliveryCharges;
  // String userTotalCost;
  String vendorTotalCost;
  // String cleaneoProfit;
  // String cleaneoCommission;
  // String paymentMode;
  DateTime createdAt;
  // DateTime updatedAt;
  List<Status> status;
 //  String deliveryAgentId;
 //  String? deliveryAgentName;
 //  String? deliveryAgentPhone;
 // // String couponId;
 //  String itemsByKg;
 //  String vendorByKg;
 //  String totalKg;

  Order({
    required this.sno,
    required this.orderId,
    required this.userId,
    required this.vendorId,
    // required this.vendorAddress,
    // required this.vendorLatitude,
    // required this.vendorLongitude,
    required this.items,
    required this.vendorItems,
    required this.pickupDate,
    required this.pickupTime,
    required this.deliveryDate,
    required this.deliveryTime,
    required this.floor,
    required this.cAddress,
    required this.htReach,
    // required this.userLatitude,
    // required this.userLongitude,
    // required this.extraNote,
    // required this.supportYourRider,
    // required this.deliveryCharges,
    // required this.userTotalCost,
    required this.vendorTotalCost,
    // required this.cleaneoProfit,
    // required this.cleaneoCommission,
    // required this.paymentMode,
    required this.createdAt,
    // required this.updatedAt,
    required this.status,
    // required this.deliveryAgentId,
    // this.deliveryAgentName,
    // this.deliveryAgentPhone,
   // required this.couponId,
   //  required this.itemsByKg,
   //  required this.vendorByKg,
   //  required this.totalKg,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    List<dynamic> itemsJson = jsonDecode(json['Items']);
    List<Item> vendorItems=[];
    print("itemsJson===$itemsJson}");


    // if (jsonDecode(json['VendorItems']) == r'\"[]\"') {
    //   // VendorItems is an empty array
    //   // Handle accordingly, such as showing a message or setting default values
    // } else {
    //   // Process the actual vendor items data
    //   // You may need to decode the escaped string within vendorItemsString
    // }


    List<Item> vendoritems = ConvertFunction().parseVendorItems(json['VendorItems']);



    List<dynamic> statusJson = jsonDecode(json['status']);
    print("statusJson===$statusJson}");



    // Map JSON objects to Item objects
    List<Item> items = itemsJson.map((itemJson) => Item.fromJson(itemJson)).toList();
    List<Status> status = statusJson.map((itemJson) => Status.fromJson(itemJson)).toList();
    print("status===${status.length}");


    return Order(
      sno: json['Sno'],
      orderId: json['OrderID'],
      userId: json['userID'],
      vendorId: json['VendorId'],
      // vendorAddress: json['VendorAddress'],
      // vendorLatitude: json['VendorLatitude'],
      // vendorLongitude: json['VendorLongitude'],
      items: items,
      vendorItems: vendoritems,

      pickupDate: json['PickupDate'],
      pickupTime: json['PickupTime'],
      deliveryDate: json['DeliveryDate'],
      deliveryTime: json['DeliveryTime'],
      floor: json['Floor'],
      cAddress: json['Caddress'],
      htReach: json['HTReach'],
      // userLatitude: json['UserLatitude'],
      // userLongitude: json['UserLongitude'],
      // extraNote: json['ExtraNote']==null?"":json['ExtraNote'],
      // supportYourRider: json['SupportYourRider']==null?"":json['SupportYourRider'],
      // deliveryCharges: json['DeliveryCharges'],
      // userTotalCost: json['UserTotalCost'],
      vendorTotalCost: json['VendorTotalCost'],
      // cleaneoProfit: json['CleaneoProfit'],
      // cleaneoCommission: json['CleaneoCommission'],
      // paymentMode: json['PaymentMode'],
      createdAt: DateTime.parse(json['created_at']),
      // updatedAt: DateTime.parse(json['updated_at']),
      status: status,
      // deliveryAgentId: json['DeliveryAgentID'],
      // deliveryAgentName: json['DeliveryAgentName']==null?"":json['DeliveryAgentName'],
      // deliveryAgentPhone: json['DeliveryAgentPhone']==null?"":json['DeliveryAgentPhone'],
      //couponId: json['CouponID']==null?"":json['CouponID'],
      // itemsByKg: json['itemsbykg']==null?"":json['itemsbykg'],
      // vendorByKg: json['vendorbykg']==null?"":json['vendorbykg'],
      // totalKg: json['total_kg'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Sno': sno,
      'OrderID': orderId,
      'userID': userId,
      'VendorId': vendorId,
      // 'VendorAddress': vendorAddress,
      // 'VendorLatitude': vendorLatitude,
      // 'VendorLongitude': vendorLongitude,
      'Items': jsonEncode(items.map((i) => i.toJson()).toList()),
      'VendorItems': jsonEncode(vendorItems.map((i) => i.toJson()).toList()),
      // 'PickupDate': pickupDate,
      // 'PickupTime': pickupTime,
      // 'DeliveryDate': deliveryDate,
      // 'DeliveryTime': deliveryTime,
      // 'Floor': floor,
      // 'Caddress': cAddress,
      // 'HTReach': htReach,
      // 'UserLatitude': userLatitude,
      // 'UserLongitude': userLongitude,
      // 'ExtraNote': extraNote,
      // 'SupportYourRider': supportYourRider,
      // 'DeliveryCharges': deliveryCharges,
      // 'UserTotalCost': userTotalCost,
      // 'VendorTotalCost': vendorTotalCost,
      // 'CleaneoProfit': cleaneoProfit,
      // 'CleaneoCommission': cleaneoCommission,
      // 'PaymentMode': paymentMode,
      // 'created_at': createdAt.toIso8601String(),
      // 'updated_at': updatedAt.toIso8601String(),
      'status': jsonEncode(status.map((s) => s.toJson()).toList()),
      // 'DeliveryAgentID': deliveryAgentId,
      // 'DeliveryAgentName': deliveryAgentName,
      // 'DeliveryAgentPhone': deliveryAgentPhone,
      // //'CouponID': couponId,
      // 'itemsbykg': itemsByKg,
      // 'vendorbykg': vendorByKg,
      // 'total_kg': totalKg,
    };
  }
}
class Item {
  String type;
  String name;
  String price;
  int quantity;

  Item({
    required this.type,
    required this.name,
    required this.price,
    required this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      type: json['type'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }
}
class Status {
  String status;
  DateTime createdAt;

  Status({
    required this.status,
    required this.createdAt,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
