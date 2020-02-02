import 'package:dio/dio.dart';

abstract class YoutubeDataApi {
  Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://www.googleapis.com/youtube/v3',
    ),
  );

  Future<dynamic> get({
    String path,
    Map<String, dynamic> params,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: params,
      );
      return response.data['items'];
    } on DioError catch (e) {
      throw Exception('Youtube Data API Error ${e.response}');
    }
  }
}
