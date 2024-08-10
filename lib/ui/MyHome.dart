import 'package:flutter/material.dart';

import 'package:weather/ui/Weather.dart';
import 'package:weather/model/WeatherData.dart';
import 'package:weather/api/MapApi.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherData? _weatherData;

  loadWeather({required double lat, required double long}) async {
    MapApi mapApi = MapApi.getInstance();
    final data = await mapApi.getWeather(lat: lat, long: long);
    setState(() {
      _weatherData = data;
    });
  }

  getCurrentLocation() {
    loadWeather(lat: 40.71, long: -74.01);
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _weatherData != null
          ? Weather(weatherData: _weatherData!)
          : Center(
        child: CircularProgressIndicator(
          strokeWidth: 4.0,
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
