import 'package:flutter/material.dart';

void main() => runApp(LoginProject());

class LoginProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Project',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isVisibile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 100.0),
              Image.network(
                'https://www.mbmc.edu.np/storage/settings/November2019/p4Esifmg1EOQclTOZPoK.png',
              ),
              _space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlineButton(
                    borderSide: BorderSide(
                      color: Colors.indigo,
                    ),
                    textColor: Colors.indigo,
                    onPressed: () {},
                    child: Text('Login with G'),
                  ),
                  OutlineButton(
                    borderSide: BorderSide(
                      color: Colors.indigo,
                    ),
                    textColor: Colors.indigo,
                    onPressed: () {},
                    child: Text('Login with f'),
                  ),
                ],
              ),
              _space,
              Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 2.0),
                  ),
                  Text(
                    '  OR  ',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Expanded(
                    child: Divider(thickness: 2.0),
                  ),
                ],
              ),
              _space,
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email ID / Phone No.',
                  hintText: 'mail@sarbagyastha.com.np',
                ),
              ),
              _space,
              TextField(
                obscureText: !_isVisibile,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isVisibile ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      _isVisibile = !_isVisibile;
                      setState(() {});
                    },
                  ),
                ),
              ),
              _space,
              MaterialButton(
                color: Colors.indigo,
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('Login'),
                ),
                textColor: Colors.white,
              ),
              SizedBox(height: 100.0),
              OutlineButton(
                borderSide: BorderSide(
                  color: Colors.indigo,
                ),
                textColor: Colors.indigo,
                onPressed: () {},
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _space => SizedBox(height: 20.0);
}
