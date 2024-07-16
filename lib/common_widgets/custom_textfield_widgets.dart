import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;
  final String? Function(String?)? onsaved;

  final TextEditingController? controller;
  int? maxlines;
  IconData? icon;


  CustomTextField( {required this.hintText, this.isPassword = false,this.validator,this.controller,this.onsaved,this.maxlines,this.icon});

  @override
  Widget build(BuildContext context) {
    return     Stack(
      children: [
              Positioned(
                top: 11,
                left: 11,
                child: Container(padding: EdgeInsets.all(13),
                  
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle
                  ),
                  child: Icon(icon,color: Colors.white,),
                ),
              ),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30)
          ),
          child: TextFormField(
            controller: controller,
            textAlign: TextAlign.center,
            maxLines: maxlines,
            onSaved:onsaved ,
            validator: validator,
            obscureText: isPassword,
            decoration: InputDecoration(
              labelText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              filled: true,
              fillColor: Colors.transparent,
              contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            ),
          ),
        ),
      ],
    );


    // Container(
    //   width: MediaQuery.of(context).size.width,
    //   margin: EdgeInsets.all(10),
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Container(
    //         decoration: BoxDecoration(
    //           color: Colors.blue,
    //           shape: BoxShape.circle
    //         ),
    //         child: Icon(Icons.person,color: Colors.white,),
    //       ),
    //     ],
    //   ),
    // );
  }
}
