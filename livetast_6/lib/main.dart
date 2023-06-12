import 'package:flutter/material.dart';

void main() {
  runApp(MyShoppingListApp());
}

class MyShoppingListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Shopping List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyShoppingListScreen(),
    );
  }
}

class MyShoppingListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shopping List'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              showSnackbar(context, 'Cart is empty');
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Milk'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Eggs'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Bread'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Apples'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Bananas'),
          )
        ],
      ),
    );
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
