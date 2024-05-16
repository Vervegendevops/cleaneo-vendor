import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cleaneo_vendor/Screens/Welcome/WelcomePage.dart';
import 'package:cleaneo_vendor/main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _selectedLanguage = 'en'; // Default language selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: 'logoTag',
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: SvgPicture.asset("assets/splash.svg", fit: BoxFit.cover),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20, // Adjust bottom margin as needed
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedLanguage = 'en';
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 8.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _selectedLanguage == 'en'
                                    ? Colors.white
                                    : Color(0xFF29B2FE),
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.language,
                                  color: _selectedLanguage == 'en'
                                      ? Colors.white
                                      : Color(0xFF29B2FE),
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  'English',
                                  style: TextStyle(
                                    fontFamily: 'SatoshiBold',
                                    color: _selectedLanguage == 'en'
                                        ? Colors.white
                                        : Color(0xFF29B2FE),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedLanguage = 'hi';
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 8.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _selectedLanguage == 'hi'
                                    ? Colors.white
                                    : Color(0xFF29B2FE),
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.translate,
                                  color: _selectedLanguage == 'hi'
                                      ? Colors.white
                                      : Color(0xFF29B2FE),
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  'हिंदी',
                                  style: TextStyle(
                                    fontFamily: 'SatoshiBold',
                                    color: _selectedLanguage == 'hi'
                                        ? Colors.white
                                        : Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Set the locale dynamically based on the selected language
                        MyApp.setLocale(context, _selectedLanguage);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const WelcomePage(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFF29B2FE)), // Set button background color
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(6.0), // Set border radius
                          ),
                        ),
                        elevation: MaterialStateProperty.all<double>(
                            0), // Set elevation
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
