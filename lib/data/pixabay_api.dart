import 'package:image_search_app/data/photo_api_repository.dart';
import 'package:image_search_app/model/photo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PixabayApi implements PhotoApiRepository {
  static const baseUrl = 'https://pixabay.com/api';
  static const key = '44128391-6c5972b117ade169206c68eea';

  @override
  Future<List<Photo>> fetch(String query, {http.Client? client}) async {
    // if client null => reset http.client.
    client ??= http.Client();

    var url =
        Uri.parse('$baseUrl/?key=$key&q=$query&image_type=photo&pretty=true');

    final response = await http.get(url);
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
