import 'dart:convert';

import 'package:cleaneo_vendor/model/cash_collection.dart';
import 'package:cleaneo_vendor/model/order_data.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;

import '../Home/OrderRequests/OrderReqDemoData.dart';
import '../main.dart';
import '../model/notification.dart';
import '../model/user.dart';
import '../utils/local_storage.dart';
import 'helper.dart';

class ApiProvider{

  Future<List<Notification>> getNotifications() async {
    User? user=await LocalStorage().getUser();
    var userID=user?.id;

    final String apiUrl =
        'https://drycleaneo.com/update/fetch_notifications.php?type=vendor&id=${UserLoggedIn.read('UID')}';
    print("url == $apiUrl");

    try {
      final response = await http.get(Uri.parse(apiUrl));
      print("response=====${response.body}");

      if (response.statusCode == 200) {
        // Parse JSON response into a list of dynamic objects
        var data=json.decode(response.body);
        final List<dynamic> jsonData = data["data"];
        jsonData.sort((a, b) {
          DateTime dateA = DateTime.parse(a['CreatedAt']);
          DateTime dateB = DateTime.parse(b['CreatedAt']);
          return dateB.compareTo(dateA);
        });

        // Map the JSON data to a list of Review objects
        List<Notification> notifications =
        jsonData.map((data) => Notification.fromJson(data)).toList();
        return notifications;
      } else {
        // If the response status code is not 200, throw an exception or handle the error accordingly.
        throw Exception('Failed to fetch reviews: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions if any occur during the request.
      throw Exception('Error fetching reviews: $e');
    }
  }

  Future<int?> deleteNotificationData(int notificationID) async {
    User? user=await LocalStorage().getUser();
    var userID=user?.id;

    final String apiUrl =
        'https://drycleaneo.com/CleaneoUser/api/notifications?NotificationID=${UserLoggedIn.read('UID')}';
    print("url == $apiUrl");

    try {
      final response = await http.delete(Uri.parse(apiUrl));
      print("response====${response.statusCode}");

      return response.statusCode;
    } catch (e) {
      // Handle exceptions if any occur during the request.
      throw Exception('Error fetching reviews: $e');

    }
  }


  Future<void> login() async {
    User? user=await LocalStorage().getUser();
    final url = 'https://drycleaneo.com/CleaneoUser/api/signedUp/${user?.phone}';
    print("url==$url");
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsondata = jsonDecode(response.body);
        User user = User.fromJson(jsondata);
        await LocalStorage().saveUser(user);


      } else {

        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {

      print('Error fetching data: $e');
    }
  }


  Future<List<Order>> getOrder() async {
    final url =
        'https://drycleaneo.com/CleaneoVendor/api/orderRequest/${UserLoggedIn.read('UID')}';
    print("url===$url");

    try {
      final response = await http.get(Uri.parse(url));
      print("response====${response.body}");

      if (response.statusCode == 200) {
          print(response.body);
          OrderRequest = jsonDecode(response.body);
          var jsonData = jsonDecode(response.body);
          List<dynamic> filteredOrders = jsonData.where((order) {
            // Decode the "status" field
            List<dynamic> statusList = json.decode(order['status']);
            print("status======${statusList.length}");
            // Include only orders where the "status" list length is more than 5
            return statusList.length<6;
          }).map((order) => Map<String, dynamic>.from(order)).toList();
          List<Order> orderList = filteredOrders.map((data) => Order.fromJson(data)).toList();
        print(OrderRequest[0]['created_at']);
        return orderList;
      } else {
        // If the response status code is not 200, throw an exception or handle
        // the error accordingly.
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions if any occur during the request.
      print('Error fetching data: $e');
      return []; // Return false in case of an error.
    }
  }

  Future<List<Order>> getDeliveredOrder() async {
    final url =
        'https://drycleaneo.com/CleaneoVendor/api/orderRequest/${UserLoggedIn.read('UID')}';
    print("url===$url");

    try {
      final response = await http.get(Uri.parse(url));
      print("response====${response.body}");

      if (response.statusCode == 200) {
        print(response.body);
        var jsonData = jsonDecode(response.body);
        List<dynamic> filteredOrders = jsonData.where((order) {
          // Decode the "status" field
          List<dynamic> statusList = json.decode(order['status']);
          print("status===${statusList.length}");
          // Include only orders where the "status" list length is more than 5
          return statusList.length ==6;
        }).map((order) => Map<String, dynamic>.from(order)).toList();

        List<Order> orderList = filteredOrders.map((data) => Order.fromJson(data)).toList();
        return orderList;
      } else {
        // If the response status code is not 200, throw an exception or handle
        // the error accordingly.
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions if any occur during the request.
      print('Error fetching data: $e');
      return []; // Return false in case of an error.
    }
  }
  Future<CashCollectionResponsse?> getEarnings() async {
    final url =
        'https://drycleaneo.com/update/vendor_cash.php?vendor_id=${UserLoggedIn.read('UID')}';
    print("url===$url");

    try {
      final response = await http.get(Uri.parse(url));
      print("response====${response.body}");

      if (response.statusCode == 200) {
        print(response.body);
        var jsonData = jsonDecode(response.body);
        if(jsonData["status"]=="error"){
          Fluttertoast.showToast(msg: "No records found for the provided vendor_id");
          return null;
        }
        else{
          CashCollectionResponsse cashCollection=CashCollectionResponsse.fromJson(jsonData);
          return cashCollection;
        }

      } else {
        // If the response status code is not 200, throw an exception or handle
        // the error accordingly.
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions if any occur during the request.
      print('Error fetching data: $e');
      return null; // Return false in case of an error.
    }
  }

  Future<int> updateOrderStatus(String status,String orderID) async {
    print("statusdata===${status.length}");
    DateTime dateTime=DateTime.now();


    Map<String,dynamic> params={
      "status": [
        {
          "status": "$status",
          "created_at": "$dateTime"
        }
      ]
    };
    print("params===${params}");
    String jsonString=jsonEncode(params);



    final url = 'https://drycleaneo.com/update/updateorderstatus.php?orderId=${orderID}';
    print("url===$url");
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: headers,
        body: jsonString,
      );
      print("response==${response.body}");

      if (response.statusCode == 200) {
        print('Order updated successfully');
        Fluttertoast.showToast(msg: "Order updated successfully");
        return response.statusCode;
      } else {
        // Error occurred
        print('Failed to update order: ${response.statusCode}');
        Fluttertoast.showToast(msg: "Failed to update order: ${response.statusCode}");
        return response.statusCode;
      }
    } catch (e) {
      print('Error: $e');
      Fluttertoast.showToast(msg: "Error: $e");
      return 0;
    }
  }


  Future<CashCollectionResponsse> fetchTransactions() async {
    final response = await http.get(Uri.parse('https://drycleaneo.com/update/vendor_cash.php?vendor_id=${UserLoggedIn.read('UID')}'));

    if (response.statusCode == 200) {
      return CashCollectionResponsse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load transactions');
    }
  }


}
