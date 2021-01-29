import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchLyrics {
  Future<String> fetchLyric(String artist, String song) async {
    final response =
        await http.get("https://api.lyrics.ovh/v1/${artist}/${song}");

    final result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return result['lyrics'];
    } else {
      return "Error";
    }
  }
}
