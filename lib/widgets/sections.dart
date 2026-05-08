import 'package:flutter/material.dart';

Widget sectionContainer(GlobalKey key, String title) {
  return Container(
    key: key,
    height: 700,
    width: double.infinity,
    padding: EdgeInsets.all(40),
    child: Text(
      title,
      style: TextStyle(color: Colors.white, fontSize: 40),
    ),
  );
}