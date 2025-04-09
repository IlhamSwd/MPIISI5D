import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/time_model.dart';

class ApiService {
  static const String baseUrl =
      'https://timeapi.io/api/time/current/zone?timeZone=Europe/Amsterdam';

  static Future<TimeData> fetchTimeData() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return TimeData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load time data');
    }
  }
}
