import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';

import '../common_widgets/custom_textfield_widgets.dart';
import 'package:http/http.dart'as http;

class JoinUsScreen extends StatefulWidget {
  const JoinUsScreen({super.key});

  @override
  State<JoinUsScreen> createState() => _JoinUsScreenState();
}

class _JoinUsScreenState extends State<JoinUsScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _mobileNumber;
  String? _message;
  String? _selectedRole;
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController messageController=TextEditingController();
  TextEditingController mobileController=TextEditingController();

  final List<String> _roles = ['Stakeholder'];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      callSubmitApi();
    }
  }
  callSubmitApi() async {
    final String apiUrl = 'https://drycleaneo.com/CleaneoUser/api/querys';
    print("url == $apiUrl");
    Map<String, String> params={
      "name":nameController.text,
      "email":emailController.text,
      "number":mobileController.text,
      "message":messageController.text,
      "user_type":_selectedRole??""
    };
    print("params==$params");
    String raw=jsonEncode(params);
    try {
      final response = await http.post(Uri.parse(apiUrl),body: raw, headers: {'Content-Type': 'application/json'},
      );
      print("a response==${response.statusCode}");

      if (response.statusCode == 201) {
        nameController.clear();
        emailController.clear();
        mobileController.clear();
        messageController.clear();
        Fluttertoast.showToast(msg: "Your request has been submitted successfully");
        setState(() {

        });

      } else {
        throw Exception('Failed to fetch reviews: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching reviews: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final mQuery = MediaQuery.of(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.blue));

    return SafeArea(
      child: Scaffold(
      
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 120,
                padding: const EdgeInsets.only(top: 32, bottom: 22,left: 5,right: 5),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/splash.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_back_sharp,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text("Join as a Partner ",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        nameText("name"),
                        CustomTextField(hintText: '',controller: nameController,onsaved: (value){
                          _name=value;
                        },
                          validator:(value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                          icon: Icons.person,),
                        nameText("Email"),
                        CustomTextField(hintText: '',controller: emailController,validator: (value){
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        icon: Icons.email,
                        ),
                        nameText("Number"),
                        CustomTextField(hintText: '',controller: mobileController,icon:Icons.mobile_screen_share,  validator:(value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a number';
                          }
                          return null;
                        },),
                     //   CustomTextField(hintText: 'Write a message',controller: messageController,icon: Icons.message,),
                        // CustomTextField(hintText: 'Write a message',controller: mobileController,maxlines: 4,  validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please enter a message';
                        //   }
                        //   return null;
                        // },),
                        nameText("Write a Message"),
                    
                      Stack(
                        children: [
                          // Positioned(
                          //   top: -3,
                          //   left: 0,
                          //   right: 0,
                          //   child: Container(padding: EdgeInsets.all(10),
                          //     decoration: BoxDecoration(
                          //         color: Colors.blue,
                          //         shape: BoxShape.circle
                          //     ),
                          //     child: Icon(Icons.message,color: Colors.white,),
                          //   ),
                          // ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: TextFormField(
                              controller: messageController,
                              maxLines: 4,
                              validator:(value) {
                          if (value == null || value.isEmpty) {
                          return 'Please enter a message';
                          }
                          return null;
                          },
                              decoration: InputDecoration(
                                labelText: "",
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
                      ),
                        nameText("User-type"),

                      Container(
                        width: 200,
                        margin: EdgeInsets.all(10),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Enter User Type',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            value: _selectedRole,
                            items: _roles.map((role) {
                              return DropdownMenuItem(
                                value: role,
                                child: Text(role),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedRole = value;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select a role';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _selectedRole = value;
                            },
                            isExpanded: false,
                            dropdownColor: Colors.white,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                        SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(10),
                          child: ElevatedButton(
                            onPressed: (){
                              _submitForm();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // Background color
                              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                              textStyle: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                          ),
                            child: const Text('Proceed',style:TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ) ,),),
                        )
                    
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget nameText(String title){
    return Container(
        padding: EdgeInsets.only(left: 15),
        child: Text(title,style: TextStyle(color: Colors.blue),));
  }
}

