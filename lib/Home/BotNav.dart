import 'package:cleaneo_vendor/Screens/Welcome/WelcomePage.dart';
import 'package:cleaneo_vendor/bloc/home/home_bloc.dart';
import 'package:cleaneo_vendor/bloc/home/home_event.dart';
import 'package:cleaneo_vendor/bloc/orders_bloc.dart';
import 'package:cleaneo_vendor/bloc/orders_event.dart';
import 'package:flutter/material.dart';
import 'package:cleaneo_vendor/Home/Donate/Donate.dart';
import 'package:cleaneo_vendor/Home/Donate/DonateSlider.dart';
import 'package:cleaneo_vendor/Home/Home_/Home.dart';
import 'package:cleaneo_vendor/Home/Notifications/Notifications.dart';
import 'package:cleaneo_vendor/Home/YourOrders/YourOrders.dart';
import 'package:cleaneo_vendor/Home/CashCollected/CashCollected.dart';
import 'package:cleaneo_vendor/Home/Earnings/MyEarnings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/notification/notification_bloc.dart';
import '../bloc/notification/notification_event.dart';
import '../notification/notification_page.dart';
import 'Earnings/Components/RowofThreeText.dart';
import 'YourOrders/Components/Rowof2Text.dart';

class BotNav extends StatefulWidget {
  int indexx;
  BotNav({Key? key, required this.indexx}) : super(key: key);

  @override
  State<BotNav> createState() => _BotNavState();
}

class _BotNavState extends State<BotNav> {
  late PageController _pageController;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.indexx;
    print(_selectedIndex);
    _pageController = PageController(initialPage: widget.indexx);
  }

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
           BlocProvider(
  create: (context) => HomeBloc(),
  child: HomePage(),
),
          //const YourOrders(),
          BlocProvider(
  create: (context) => OrdersBloc()..add(GetOrderEvent())..add(GetPreviousOrderEvent()),
  child: YourOrders2Text(),
),
          BlocProvider(
            create: (context) => NotificationBloc()..add(GetNotificationEvent()),
            child: NotificationsPage(),
          ),
          Donate(),
           BlocProvider(
  create: (context) => HomeBloc()..add(GetEarningsEvent()),
  child: NavigationWithTabs(),
),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Change the background color here
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), // Adjust the top-left radius here
            topRight: Radius.circular(24), // Adjust the top-right radius here
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_rounded),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active_rounded),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.handshake_rounded),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: ' ',
            ),
          ],
          backgroundColor: Colors.white, // Change the background color here
          iconSize: 31,
          selectedItemColor:
              Color(0xff29B2FE), // Change the selected item color here
          unselectedItemColor:
              Colors.grey, // Change the unselected item color here
          selectedFontSize: 14, // Adjust the selected item font size here
          unselectedFontSize: 12, // Adjust the unselected item font size here
          selectedLabelStyle: TextStyle(
              fontWeight:
                  FontWeight.bold), // Adjust the selected item label style here
          // borderRadius: BorderRadius.circular(10), // Apply border radius here
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Sign Out'),
        content: Text('Do you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const WelcomePage(),
                ),
              );
            },
            child: Text('Sign Out'),
          ),
        ],
      ),
    ).then((value) => value ?? false);
  }
}
