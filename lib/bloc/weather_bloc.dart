import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:virtusa_assignment1/api/Network.dart';
import 'package:virtusa_assignment1/models/WeatherResponse.dart';

class WeatherBloc {
  final _weatherFetcher = BehaviorSubject<WeatherResponse>();
  Observable<WeatherResponse> get weather => _weatherFetcher.stream;
  Network _network = new Network("");
  fetchLondonWeather() async {
    WeatherResponse weatherResponse = await _network.fetchWeather();
    _weatherFetcher.sink.add(weatherResponse);
  }

  dispose() {
    _weatherFetcher.close();
  }
}

final weatherBloc = WeatherBloc();
