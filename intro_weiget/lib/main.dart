import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:location/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  String _temperature = '';
  String _description = '';
  String _iconUrl = '';
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  void fetchWeatherData() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    // Check if location services are enabled
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        setState(() {
          _isLoading = false;
          _hasError = true;
        });
        return;
      }
    }

    // Check if location permissions are granted
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        setState(() {
          _isLoading = false;
          _hasError = true;
        });
        return;
      }
    }

    // Get the current location
    _locationData = await location.getLocation();

    // Fetch weather data
    String apiKey = 'Onus_API_KEY';
    String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?lat=${_locationData.latitude}&lon=${_locationData.longitude}&units=metric&appid=d1a257bda30a18a41e6fb65993c744fb';

    try {
      http.Response response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        setState(() {
          _location = data['name'];
          _temperature = '${data['main']['temp']}°C';
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
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: _isLoading
            ? SpinKitDoubleBounce(
          color: Colors.blue,
          size: 50.0,
        )
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
            SizedBox(height: 16.0),
            Image.network(
              _iconUrl,
              width: 100.0,
              height: 100.0,
            ),
            SizedBox(height: 16.0),
            Text(
              _temperature,
              style: TextStyle(fontSize: 48.0),
            ),
            SizedBox(height: 16.0),
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
