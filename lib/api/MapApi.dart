import 'package:http/http.dart' show Client;
import 'package:weather/model/WeatherData.dart';

class MapApi {

    static const _apiKey = '4be358def462ad4543fa42c013b92a85';
    static const _endpoint = 'http:api.openweathermap.org/data/2.5';

    late double lat, long;
    Client client = Client();

    static late MapApi _instance;
    static MapApi getInstance() => _instance ??= MapApi();

    String _apiCall({required double lat, required double long}){
      return _endpoint + '/weather?lat=' + lat.toString() + '&long=' + long.toString() + "&APPID=" + _apiKey + "&units=metric";
    }

    getWeather({required double lat, required double long}) async {
      var response = await client.get(
        Uri.encodeFull(_apiCall(lat: lat, long: long)) as Uri,
        headers: {
          'Accept' : 'application/json'
        }
      );
      return WeatherData.deserialize(response.body);
    }

}
