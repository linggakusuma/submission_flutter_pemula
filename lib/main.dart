import 'package:flutter/material.dart';
import 'package:submission_flutter_pemula/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cupangers",
      theme: ThemeData(fontFamily: 'Gayathri'),
      home: MainScreen(),
    );
  }
}
