import 'package:flutter/material.dart';
import 'package:website_portofolio/components/default_button.dart';
import 'package:website_portofolio/components/my_outline_button.dart';
import 'package:website_portofolio/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/about_section_text.dart';
import 'components/about_text_with_sign.dart';
import 'components/experience_card.dart';

final Uri _resume = Uri.parse(
    'https://rxresu.me/gopalkumargupta337/imported-from-reactive-resume-30032023163953');
final Uri _mail = Uri.parse('mailto:gopal.kmr@yahoo.com');

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AboutTextWithSign(),
              Expanded(
                child: AboutSectionText(
                  text:
                      "I'm Second year Student persuing Bachlor of Technology in The field of Information Technology",
                ),
              ),
              ExperienceCard(numOfExp: "08"),
              Expanded(
                child: AboutSectionText(
                  text:
                      "Handeling Multiple Projects in our university and also working on some personal projects",
                ),
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding * 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyOutlineButton(
                imageSrc: "assets/images/hand.png",
                text: "Contact Me",
                press: () => _launchUrl(_mail),
              ),
              SizedBox(width: kDefaultPadding * 1.5),
              DefaultButton(
                imageSrc: "assets/images/download.png",
                text: "Download CV",
                press: () => _launchUrl(_resume),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<void> _launchUrl(@required _url) async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
