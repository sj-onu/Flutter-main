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
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return _buildPortraitLayout();
        } else {
          return _buildLandscapeLayout();
        }
      },
    );
  }

  Widget _buildPortraitLayout() {
    return Scaffold(
      appBar: AppBar(title: Text('News Feed')),
      body: ListView(
        children: [
          for (int i = 0; i < 5; i++)
            _buildNewsArticle(i),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout() {
    return Scaffold(
      appBar: AppBar(title: Text('News Feed')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1,
        ),
        itemBuilder: (context, index) {
          return _buildNewsArticle(index);
        },
      ),
    );
  }

  Widget _buildNewsArticle(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9ps71CC6UQWj7fzZ2aY7FWWfHbCTaVkH5khbA5nS7Hg&s'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('This is news article #$index'),
            ),
          ],
        ),
      ),
    );
  }
}