import 'package:flutter/material.dart';
import 'package:website_portofolio/constants.dart';
import 'package:website_portofolio/home_screen.dart';
//import 'package:url_launcher/url_launcher.dart';
//import 'dart:io' show Platform;
//import 'package:flutter/foundation.dart' show kIsWeb;
//import 'package:website_portofolio/home_screen_phone.dart';
import 'dart:html' as html;

//final Uri _othersite = Uri.parse('https://projectwithgopal.vercel.app');

void main() {
  runApp(MyApp());
}

/*
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portofolio',
      theme: ThemeData(
        inputDecorationTheme: kDefaultInputDecorationTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
*/

/*

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      // Redirect to a mobile webpage
      // _launchUrl(_othersite); not working
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Portofolio',
        theme: ThemeData(
          inputDecorationTheme: kDefaultInputDecorationTheme,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Homescreenphone(),
      );

      //return Container(); // Return an empty container as the widget tree needs to return a widget
    } else {
      // Use the default desktop layout
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Portofolio',
        theme: ThemeData(
          inputDecorationTheme: kDefaultInputDecorationTheme,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      );
      print('Running in the web');
    }
  }

  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}

*/

int? screenWidth = html.window.innerWidth;

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  String _redirectUrl = '';

  @override
  void initState() {
    super.initState();
    _checkForMobile();
  }

  void _checkForMobile() {
    if (screenWidth != null && screenWidth! < 600) {
      // Change 600 to a different value to adjust the screen width at which you want to redirect users to the mobile URL
      setState(() {
        _redirectUrl =
            'https://projectwithgopal.vercel.app/'; // Replace this with the URL you want to redirect users to when they are using a mobile browser
      });
      html.window.location.href = _redirectUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portofolio',
      theme: ThemeData(
        inputDecorationTheme: kDefaultInputDecorationTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
