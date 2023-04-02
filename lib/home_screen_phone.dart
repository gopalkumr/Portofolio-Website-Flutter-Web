import 'package:buttons_flutter/buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _othersite = Uri.parse('https://projectwithgopal.vercel.app');

class Homescreenphone extends StatelessWidget {
  const Homescreenphone({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ButtonPage(),
    );
  }
}

class ButtonPage extends StatefulWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 100),
          Text('Oh snap, You are on mobile, Please click here to redirect'),
          Center(
            child: Button(
              borderRadius: 10,
              bgColor: Colors.blueAccent,
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              onPressed: () {
                showSnack(context, "redirect button Pressed");
                _launchUrl(_othersite);
              },
              child: const Text("redirect"),
            ),
          ),
        ],
      ),
    );
  }

  showSnack(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Colors.blue,
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}

Future<void> _launchUrl(_url) async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
