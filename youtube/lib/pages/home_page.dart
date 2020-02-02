import 'package:flutter/material.dart';
import 'package:youtube/models/video.dart';
import 'package:youtube/pages/youtube_page.dart';
import 'package:youtube/services/youtube_service.dart';

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
      body: FutureBuilder<List<Video>>(
        future: YoutubeService().getVideos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final video = snapshot.data[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => YoutubePage(
                          videoId: video.id.videoId,
                        ),
                      ),
                    );
                  },
                  child: _Video(
                    title: video.snippet.title,
                    subtitle:
                        '${video.snippet.channelTitle} * ${video.snippet.publishedAt}',
                    thumbnailUrl: video.snippet.thumbnails.high.url,
                  ),
                );
              },
              itemCount: snapshot.data.length,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
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
  final String thumbnailUrl;
  final String title;
  final String subtitle;

  _Video({
    this.thumbnailUrl,
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
            thumbnailUrl,
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
