import 'dart:convert';

class Notification {
  int notificationID;
  String? userID;
  String? vendorID;
  String? deliveryAgentID;
  String orderID;
  String notificationMessage;
  DateTime createdAt;

  Notification({
    required this.notificationID,
    this.userID,
    this.vendorID,
    this.deliveryAgentID,
    required this.orderID,
    required this.notificationMessage,
    required this.createdAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      notificationID: json['NotificationID'],
      userID: json['UserID']==null?"":json['UserID'],
      vendorID: json['VendorID']==null?"":json['VendorID'],
      deliveryAgentID: json['DeliveryAgentID']==null?"":json['DeliveryAgentID'],
      orderID: json['OrderID']==null?"":json['OrderID'],
      notificationMessage: json['NotificationMessage']==null?"":json['NotificationMessage'],
      createdAt: DateTime.parse(json['CreatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'NotificationID': notificationID,
      'UserID': userID,
      'VendorID': vendorID,
      'DeliveryAgentID': deliveryAgentID,
      'OrderID': orderID,
      'NotificationMessage': notificationMessage,
      'CreatedAt': createdAt.toIso8601String(),
    };
  }
}

