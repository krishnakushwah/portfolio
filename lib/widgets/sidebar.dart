import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.email, color: Colors.white),
        SizedBox(height: 20),

        FaIcon(FontAwesomeIcons.github, color: Colors.white),
        SizedBox(height: 20),

        FaIcon(FontAwesomeIcons.linkedin, color: Colors.white),
        SizedBox(height: 20),

        FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white),
      ],
    );
  }
}