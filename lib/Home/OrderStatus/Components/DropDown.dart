import 'package:flutter/material.dart';

class AnimatedDropdown extends StatefulWidget {
  @override
  _AnimatedDropdownState createState() => _AnimatedDropdownState();
}

class _AnimatedDropdownState extends State<AnimatedDropdown> {
  String _selectedItem = 'In Process'; // Initially selected item
  List<String> _dropdownItems = ['In Process', 'Accepted', 'On its Way', 'Delivered'];

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
          style: TextStyle(color: Colors.black,
           fontFamily: 'SatoshiMedium'),
          onChanged: (String? newValue) {
            setState(() {
              _selectedItem = newValue!;
            });
          },
          items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
 
