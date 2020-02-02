import 'package:flutter/material.dart';
import 'package:login_project/home_page.dart';
import 'package:login_project/main.dart';
import 'package:login_project/preference_service.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PreferenceService().email == null
                ? LoginPage()
                : HomePage(
                    username: PreferenceService().email,
                    password: '',
                  ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text('Splash Page'),
      ),
    );
  }
}
