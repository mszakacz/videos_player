import 'dart:convert';

import './models/models.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class VideosApi {
  const VideosApi();

  Future<List<Video>> getVideosList() async {
    final uri = Uri.https(
        'https://62175a5d71e7672e537b9a06.mockapi.io', '/api/v1/videos');
    final response = await http.get(uri);
    final jsonList = jsonDecode(response.body);

    final List<Video> videos = [];
    for (var jsonVideo in jsonList) {
      final video = Video.fromJson(jsonVideo);
      videos.add(video);
    }
    return videos;
  }
}
