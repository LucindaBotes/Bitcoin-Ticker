import 'package:flutter/material.dart';
import 'price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFFbec9ed),
          scaffoldBackgroundColor: Color(0xFFFFFFFF)),
      home: PriceScreen(),
    );
  }
}