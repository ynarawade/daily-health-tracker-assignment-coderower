import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/activity_model.dart';

class ActivityService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<Activity>> fetchPosts({
    int start = 0,
    int limit = 10,
  }) async {
    final response = await http.get(
      Uri.parse("$_baseUrl/posts?_start=$start&_limit=$limit"),
      headers: {'Accept': 'application/json'},
    );
    print("RESPONSE---${response.statusCode}");

    if (response.statusCode == 200) {
      final List jsonList = json.decode(response.body);
      return jsonList.map((e) => Activity.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
