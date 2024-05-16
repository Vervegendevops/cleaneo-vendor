import 'package:cleaneo_vendor/Screens/Welcome/Components/termsService.dart';
import 'package:flutter/material.dart';

class DropdownLedger extends StatefulWidget {
  @override
  _DropdownLedgerState createState() => _DropdownLedgerState();
}

class _DropdownLedgerState extends State<DropdownLedger> {
  String _selectedItem = 'Today'; // Initially selected item
  final List<String> _dropdownItems = ['Today', 'Yesturday','This Week','This Month'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white, // Background color
        border: Border.all(color: Colors.grey), // Border color
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedItem,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.black),
          onChanged: (String? newValue) {
            setState(() {
              _selectedItem = newValue!;
            });
          },
          items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              
              value: value,
              child: Text(value,style: TextStyle(
                fontFamily: 'SatoshiMedium'
              ),),
            );
          }).toList(),
        ),
      ),
    );
  }
}
 
