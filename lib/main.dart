import 'package:cleaneo_vendor/Home/BotNav.dart';
import 'package:cleaneo_vendor/Screens/Splash.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';

String Otp = '';
final UserLoggedIn = GetStorage();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, String languageCode) {
    final _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    if (state != null) {
      state.setLocale(languageCode);
    } else {
      throw Exception("Can't find _MyAppState");
    }
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Locale _locale = const Locale('en');

  void setLocale(String languageCode) {
    setState(() {
      _locale = Locale(languageCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(UserLoggedIn.read('IsAuthenticated'));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cleaneo Vendor',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        locale: _locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('hi')],
        home: UserLoggedIn.read('IsAuthenticated') == 'true'
            ? BotNav(
                indexx: 0,
              )
            : SplashScreen());
  }
}

final authentication = GetStorage().write('Authentication', '');
// Check
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}
