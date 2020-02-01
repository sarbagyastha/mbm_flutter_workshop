import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Sarbagya'),
            accountEmail: Text('mail@sarbagyastha.com.np'),
          ),
          ListTile(
            title: Text('Menu 1'),
          ),
          Divider(),
          ListTile(
            title: Text('Menu 2'),
          ),
          Divider(),
          ListTile(
            title: Text('Menu 3'),
          ),
          Divider(),
          ListTile(
            title: Text('Menu 4'),
          ),
          Divider(),
          ListTile(
            title: Text('Menu 5'),
          ),
        ],
      ),
    );
  }
}
