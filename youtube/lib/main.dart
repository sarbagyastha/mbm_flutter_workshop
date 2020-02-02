import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/youtube-logo.png',
          width: 100.0,
          fit: BoxFit.fitWidth,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          CircleAvatar(
            child: Text('SD'),
            backgroundColor: Colors.green,
          ),
        ],
      ),
      body: ListView(
        children: [
          _Video(
            videoId: 'ph2mOBx3JmU',
            title: 'Thumka | Anchal Sharma',
            subtitle: 'Budha Subba * 237k * 3 days ago',
          ),
          _Video(
            videoId: 'X77gJavfJq0',
            title:
                'Joker | Saroj Tamang | Ashma Bishwokarma jhsfdjhdsfjsdjfsdjfjdshjfhdjsfjdsfgdsyfdsbfds fds f sdf sd fsd f sdf sd fds fsdfsdfs ',
            subtitle: 'OSR Digital * 1.2M * 4 days ago',
          ),
          _Video(
            videoId: '8lYAbpjFHOI',
          ),
          _Video(
            videoId: '-kVUygjWVG4',
          ),
          _Video(
            videoId: 'wzH8bVWrxJg',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          _selectedIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            title: Text('Trending'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            title: Text('Subscriptions'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Inbox'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            title: Text('Library'),
          ),
        ],
      ),
    );
  }
}

class _Video extends StatelessWidget {
  final String videoId;
  final String title;
  final String subtitle;

  _Video({
    this.videoId,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            'https://i3.ytimg.com/vi_webp/$videoId/hqdefault.webp',
            fit: BoxFit.fitWidth,
          ),
        ),
        ListTile(
          leading: CircleAvatar(
            child: Text('BS'),
          ),
          title: Text(
            title ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(subtitle ?? ''),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}
