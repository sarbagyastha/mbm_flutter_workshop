import 'package:flutter/material.dart';
import 'package:login_project/home_page.dart';
import 'package:login_project/preference_service.dart';
import 'package:login_project/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PreferenceService();
  runApp(LoginProject());
}

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
      home: SplashPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isVisibile = false;

  TextEditingController _emailController;
  TextEditingController _passwordController;
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                    _OutlineButton('Login with G'),
                    _OutlineButton('Login with f'),
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
                TextFormField(
                  validator: (value) {
                    return RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(value)
                        ? null
                        : 'Email is invalid!';
                  },
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email ID / Phone No.',
                    hintText: 'mail@sarbagyastha.com.np',
                  ),
                ),
                _space,
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isVisibile,
                  validator: (value) {
                    return value.length >= 6
                        ? null
                        : 'Password should be at least 6 digit';
                  },
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
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      PreferenceService().email = _emailController.text;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomePage(
                              username: _emailController.text,
                              password: _passwordController.text,
                            );
                          },
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text('Login'),
                  ),
                  textColor: Colors.white,
                ),
                SizedBox(height: 100.0),
                _OutlineButton(
                  'Sign Up',
                  onTap: () {
                    print('signed up');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _space => SizedBox(height: 20.0);
}

class _OutlineButton extends StatelessWidget {
  final String buttonText;
  final void Function() onTap;

  _OutlineButton(this.buttonText, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      borderSide: BorderSide(
        color: Colors.indigo,
      ),
      textColor: Colors.indigo,
      onPressed: onTap,
      child: Text(buttonText),
    );
  }
}
