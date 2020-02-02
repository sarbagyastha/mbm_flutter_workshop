import 'package:youtube/configs/app_config.dart';
import 'package:youtube/models/video.dart';
import 'package:youtube/services/youtube_data_api.dart';

class YoutubeService extends YoutubeDataApi {
  Future<List<Video>> getVideos() async {
    List<dynamic> _rawVideos = await get(
      path: '/search',
      params: {
        'part': 'snippet',
        'q': '',
        'key': AppConfig.API_KEY,
        'maxResults': 25,
        'fields':
            'items(id/videoId, snippet(publishedAt, title, thumbnails, channelTitle))',
      },
    );
    return _rawVideos
        .map(
          (video) => Video.fromJson(video),
        )
        .toList();
  }
}
