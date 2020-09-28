import 'dart:convert';

import 'package:http/http.dart';
import 'package:virtusa_assignment1/models/WeatherResponse.dart';

class Network {
  final String url;
  Map<String, String> header = {
    'Content-type': 'application/json',
  };
  Network(this.url);
  // String proxyurl = "https://cors-anywhere.herokuapp.com/";

  final _baseUrl =
      "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22";

  Future<WeatherResponse> fetchWeather() async {
    final response = await get("$_baseUrl");
    print(response.body.toString());

    if (response.statusCode == 200) {
      return WeatherResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
