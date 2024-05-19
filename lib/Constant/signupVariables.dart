import 'package:image_picker/image_picker.dart';

String name = "";
String uniqueOTP = '';
String phoneFinal = "";
String email = "";
List<String> selectedServices = [];
String UserOTP = "";
String storeName = "";
String address = "";
String gst = "";
String CountUser = "";
String UserID = "";
String panFinal = '';
XFile? selfieFinal; // for take a selfie
XFile? aadhar1;
XFile? aadhar2;
XFile? pan;
List<XFile?> store_picture = List.filled(4, null);
List<XFile?> store_document = List.filled(4, null);
String ALatitude = '';
String ALongitude = '';
String PlaceID = '';
String Caddress = '';
const String apiKey = "AIzaSyAlcZM-RHySJIQmUwOaJmJCVPZcuMKS70Y";
