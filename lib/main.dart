import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
                child: Text("View A"),
              ),
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.blue,
              child: Text("View B"),
            )
          ],
        )
      ),
    );
  }
}


