
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get_storage/get_storage.dart';

import '../../bloc/notification/notification_bloc.dart';
import '../../bloc/notification/notification_event.dart';
import '../../bloc/notification/notification_state.dart';
import '../../utils/convert_function.dart';
import '../Home/Drawer.dart';

final authentication = GetStorage();

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Color(0xff006acb),));
    var mQuery = MediaQuery.of(context);
    var mobileNo = "+91 1234567890";
    var vCode = "CL123456";
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
      body: Stack(
        children: [
          BlocBuilder<NotificationBloc, NotificationState>(
            builder: (context, state) {
              return Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(height: mQuery.size.height * 0.034),
                    Container(
                      color: Color(0xff006acb),

                      child: Padding(
                        padding: EdgeInsets.only(
                          top: mQuery.size.height * 0.058,
                          bottom: mQuery.size.height * 0.03,
                          left: mQuery.size.width * 0.045,
                          right: mQuery.size.width * 0.045,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _scaffoldKey.currentState!.openDrawer();
                              },
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: mQuery.size.height * 0.04,
                              ),
                            ),
                            SizedBox(
                              width: mQuery.size.width * 0.045,
                            ),
                            Text(
                              "Notifications",
                              style: TextStyle(
                                fontSize: mQuery.size.height * 0.027,
                                color: Colors.white,
                                fontFamily: 'SatoshiBold',
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            // Text(
                            //   "Clear All",
                            //   style: TextStyle(
                            //       color: Colors.white,
                            //       fontFamily: 'SatoshiMedium',
                            //       fontSize: mQuery.size.height * 0.0175),
                            // )
                          ],
                        ),
                      ),
                    ),
                    authentication.read('Authentication') == 'Guest'
                        ? Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.7304,
                      width: double.infinity,
                      color: Colors.white,
                      child: Center(child: Text('No Notifications to show')),
                    )
                        : Expanded(
                      child:ListView.builder(
                          itemCount: state.notificationList.length,
                          itemBuilder: (context,index){
                            var data=state.notificationList[index];




                            return  Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16)),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey.withOpacity(0.5),
                            //     spreadRadius: 0.3,
                            //     blurRadius: 1,
                            //     offset: Offset(
                            //         3, 3), // changes the position of the shadow
                            //   ),
                            // ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: mQuery.size.height * 0.028,
                              left: mQuery.size.width * 0.045,
                              right: mQuery.size.width * 0.045,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: mQuery.size.height * 0.15,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 0,
                                            blurRadius: 6,
                                            offset: Offset(0, 0))
                                      ]),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: mQuery.size.height * 0.006,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                              mQuery.size.width * 0.033),
                                          child: Row(
                                            children: [
                                              Text(
                                              //  "Order Ready",
                                                "OrderID : ${data.orderID}",
                                                style: TextStyle(
                                                    color: Color(0xff29b2fe),
                                                    fontFamily: 'SatoshiBold',
                                                    fontSize:
                                                    mQuery.size.height * 0.018),
                                              ),
                                              Expanded(child: SizedBox()),
                                              InkWell(
                                                onTap: (){
                                                  BlocProvider.of<NotificationBloc>(context).add(DeleteNotificationEvent(data.notificationID));
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.black54,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: mQuery.size.height * 0.01,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: mQuery.size.width * 0.14,
                                              left: mQuery.size.width * 0.033),
                                          child: Text(
                                            "${ConvertFunction().extractNotificationText(data.notificationMessage)}",
                                            maxLines: 3,
                                            style: TextStyle(
                                              fontSize: mQuery.size.height * 0.016,
                                              fontFamily: 'SatoshiRegular',
                                            ),
                                          ),
                                        ),


                                        SizedBox(
                                          height: mQuery.size.height * 0.01,
                                        ),
                                        SizedBox(
                                          height: mQuery.size.height * 0.01,
                                        ),
                                        Divider(),
                                        Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                //"02:05 PM",
                                                "${ConvertFunction.getTime(data.createdAt.toString())}",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontFamily: 'SatoshiRegular',
                                                    fontSize: mQuery.size.height *
                                                        0.0155),
                                              ),
                                              Text(
                                                //"02:05 PM",
                                                  "${ConvertFunction.getDate(data.createdAt.toString())}",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontFamily: 'SatoshiRegular',
                                                    fontSize: mQuery.size.height *
                                                        0.0155),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );

                          })

                    ),
                    SizedBox(height: 5,)
                  ],
                ),
              );
            },
          ),
          BlocBuilder<NotificationBloc,NotificationState>(builder: (context,state){
            if(state.notificationStatus==NotificationStatus.loading||state.deleteNotificationStatus==DeleteNotificationStatus.loading){
              return Center(child:CircularProgressIndicator(color: Colors.blue,strokeWidth: 1,),);
            }
            else{
              return Container();
            }
          })
        ],
      ),
    );
  }
}
