import 'package:flutter/material.dart';
import 'package:flutter_widget_29092022/demo_statefull_widget.dart';
import 'package:flutter_widget_29092022/todo_list.dart';

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
      home: TodoListPage(),
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
            Container(
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.red,
                    child: Text("View A"),
                  ),
                  Positioned(
                    left: -10,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      child: Text("View B"),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}


