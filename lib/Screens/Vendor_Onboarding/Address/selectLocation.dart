import 'dart:convert';
import 'package:cleaneo_vendor/Constant/signupVariables.dart';
import 'package:cleaneo_vendor/Screens/Vendor_Onboarding/Address/components/location_list_tile.dart';
import 'package:cleaneo_vendor/Screens/Vendor_Onboarding/Address/components/network_utility.dart';
import 'package:cleaneo_vendor/Screens/Vendor_Onboarding/Address/models/autocomplate_prediction.dart';
import 'package:cleaneo_vendor/Screens/Vendor_Onboarding/Address/models/place_auto_complate_response.dart';
import 'package:cleaneo_vendor/Screens/Vendor_Onboarding/Address/test1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({Key? key}) : super(key: key);

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  bool isChecked = false;
  Position? currentPosition;
  List<AutocompletePrediction> placePredictions = [];

  void PlaceAutocomplate(String query) async {
    Uri uri =
        Uri.https("maps.googleapis.com", 'maps/api/place/autocomplete/json', {
      "input": query,
      "key": apiKey,
    });
    String? response = await NetworkUtility.fetchUrl(uri);
    print(response);
    if (response != null) {
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response);
      if (result.predictions != null) {
        setState(() {
          placePredictions = result.predictions!;
        });
      }
    }
  }

  void getLatLong() async {
    final apiKey = 'AIzaSyAlcZM-RHySJIQmUwOaJmJCVPZcuMKS70Y';
    final placeId = PlaceID;
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=$apiKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // Parse the JSON response
      final data = jsonDecode(response.body);

      // Extract the latitude and longitude
      final location = data['result']['geometry']['location'];
      final latitude = location['lat'];
      final longitude = location['lng'];
      ALatitude = latitude.toString();
      ALongitude = longitude.toString();
      // Print the latitude and longitude
      print('Latitude: $ALatitude');
      print('Longitude: $ALongitude');
      Navigator.pop(context);
    } else {
      // Handle the error
      print('Failed to load place details');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        // leading: Padding(
        //   padding: const EdgeInsets.only(left: defaultPadding),
        //   child: Padding(
        //       padding: const EdgeInsets.only(left: 6, right: 6),
        //       child: Icon(Icons.arrow_back)),
        // ),
        title: const Text(
          "Select Pickup Address",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Test1(),
            Form(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  onChanged: (value) {
                    PlaceAutocomplate(value);
                  },
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: "Search your location",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: SvgPicture.asset(
                        "assets/icons/location_pin.svg",
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Test1()),
                      ).then((value) => Navigator.pop(context));
                    },
                    child: Text(
                      'Select on Map',
                      style: TextStyle(color: Color(0xff29b2fe)),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Color(0xff29b2fe))),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      backgroundColor: Colors.white,
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
                child: ListView.builder(
              itemCount: placePredictions.length,
              itemBuilder: (context, index) => LocationListTile(
                press: () {
                  Caddress = placePredictions[index].description!;
                  PlaceID = placePredictions[index].placeId.toString();
                  address = placePredictions[index].description!;
                  print(PlaceID);
                  getLatLong();

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const SAddress()),
                  // );
                },
                location: placePredictions[index].description!,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
