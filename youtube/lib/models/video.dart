import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class Video {
  final Id id;
  final Snippet snippet;

  Video({
    this.id,
    this.snippet,
  });

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}

@JsonSerializable()
class Id {
  final String videoId;

  Id({
    this.videoId,
  });

  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);
}

@JsonSerializable()
class Snippet {
  final String publishedAt;
  final String title;
  final Thumbnails thumbnails;
  final String channelTitle;

  Snippet({
    this.publishedAt,
    this.title,
    this.thumbnails,
    this.channelTitle,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) =>
      _$SnippetFromJson(json);
}

@JsonSerializable()
class Thumbnails {
  @JsonKey(name: 'default')
  final Thumbnail def;
  final Thumbnail medium;
  final Thumbnail high;

  Thumbnails({
    this.def,
    this.medium,
    this.high,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailsFromJson(json);
}

@JsonSerializable()
class Thumbnail {
  final String url;
  final int width;
  final int height;

  Thumbnail({
    this.url,
    this.width,
    this.height,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);
}
