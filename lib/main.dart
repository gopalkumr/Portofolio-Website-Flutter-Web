import 'package:flutter/material.dart';
import 'package:website_portofolio/constants.dart';
import 'package:website_portofolio/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

final Uri _othersite = Uri.parse('https://projectwithgopal.vercel.app');

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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      // Redirect to a mobile webpage
      _launchUrl(_othersite);
      return Container(); // Return an empty container as the widget tree needs to return a widget
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
    }
  }

  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
