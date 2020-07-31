import 'package:flutter/material.dart';

import './MainConfiguration/MyTheme.dart';

import './Pages/HomePage/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with MyTheme {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: "Sample Snippets",
      theme: getTheme,
    );
  }
}
