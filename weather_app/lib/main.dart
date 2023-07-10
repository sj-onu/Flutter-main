import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: WeatherPage(),
    );
  }
}

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String _location = '';
  String _updatedTime = '';
  String _temperature = '';
  String _description = '';
  String _iconUrl = '';
  double _minTemperature = 0.0;
  double _maxTemperature = 0.0;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  void fetchWeatherData() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
      return;
    }

    String apiKey = 'Onus_API_KEY';
    String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&units=metric&appid=d1a257bda30a18a41e6fb65993c744fb';

    try {
      http.Response response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        setState(() {
          _location = data['name'];
          _updatedTime = DateFormat.jm().format(DateTime.now());
          _temperature = '${data['main']['temp']}°C';
          _minTemperature = data['main']['temp_min'];
          _maxTemperature = data['main']['temp_max'];
          _description = data['weather'][0]['description'];
          _iconUrl =
          'http://openweathermap.org/img/wn/${data['weather'][0]['icon']}.png';
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _hasError = true;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _hasError
            ? Text(
          'Error fetching weather data.',
          style: TextStyle(fontSize: 18.0),
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _location,
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Updated at $_updatedTime',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Image.network(
              _iconUrl,
              width: 100.0,
              height: 100.0,
            ),
            SizedBox(height: 8.0),
            Text(
              _temperature,
              style: TextStyle(fontSize: 48.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Min: ${_minTemperature.toStringAsFixed(1)}°C',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 4.0),
            Text(
              'Max: ${_maxTemperature.toStringAsFixed(2)}°C',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              _description,
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
