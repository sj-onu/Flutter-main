import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Orientation _orientation = Orientation.landscape;
  List<String> images = ['https://cdn.pixabay.com/photo/2016/11/21/12/29/owl-1845060_1280.jpg',
    'https://cdn.pixabay.com/photo/2014/02/27/16/08/owl-275942_640.jpg',
    'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_640.jpg',
    'https://cdn.pixabay.com/photo/2016/01/08/11/57/butterflies-1127666_640.jpg',
    'https://cdn.pixabay.com/photo/2018/02/09/21/46/rose-3142529_640.jpg',];

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        _orientation = orientation;
        return Scaffold(
          appBar: AppBar(title: Text('Flutter Demo')),
          body: _buildBody(),
        );
      },
    );
  }

  Widget _buildBody() {
    if (_orientation == Orientation.portrait) {
      return Column(
        children: [
          for (String image in images)
            Image.network(
              image,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          Text('This is the portrait layout'),
        ],
      );
    } else {
      return Row(
        children: [
          Image.network('https://cdn.pixabay.com/photo/2018/02/09/21/46/rose-3142529_640.jpg',
            height: 200,
            width: 200,
            fit: BoxFit.fill,

          ),
          Text('This is the landscape layout',
            style: TextStyle(fontWeight: FontWeight.bold),),

          for (String image in images)
            Image.network(
              image,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          Text('This is the landscape layout'),
        ],
      );
    }
  }
}