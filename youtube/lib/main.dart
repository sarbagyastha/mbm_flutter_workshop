import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() => runApp(Youtube());

class Youtube extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.grey[800],
          ),
        ),
      ),
    );
  }
}
