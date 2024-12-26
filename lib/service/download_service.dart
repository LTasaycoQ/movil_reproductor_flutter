import 'package:flutter_application_1/model/download_Video_Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<VideoData?> fetchVideoData(String url) async {
  try {
    final encodedUrl = Uri.encodeComponent(url);

    final response = await http.get(Uri.parse(
        'https://all-donwload-videos-api.onrender.com/api/download?url=$encodedUrl'));

    if (response.statusCode == 200) {
      return VideoData.fromJson(jsonDecode(response.body));
    } else {
      print('Error: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error al hacer la solicitud: $e');
    return null;
  }
}
