import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;
  final String password;

  const HomePage({
    this.username,
    this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(username),
            Text(password),
          ],
        ),
      ),
    );
  }
}
