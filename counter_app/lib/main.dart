import 'package:flutter/material.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: CountingPage(),
    );
  }
}

class CountingPage extends StatefulWidget {
  @override
  _CountingPageState createState() => _CountingPageState();
}

class _CountingPageState extends State<CountingPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counting App'),
      ),
      body: Center(
        child: Text(
          _count.toString(),
          style: TextStyle(
            fontSize: 40.0,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              _count++;
              setState(() {});
            },
          ),
          SizedBox(height: 10.0),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              _count--;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
