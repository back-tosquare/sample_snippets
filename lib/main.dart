import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import './MainConfiguration/MyTheme.dart';
import './models/providers/FormValue.dart';

import './Pages/HomePage/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with MyTheme {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (ctx) => FormValue(),
        child: HomePage(),
      ),
      title: "Sample Snippets",
      theme: getTheme,
    );
  }
}
