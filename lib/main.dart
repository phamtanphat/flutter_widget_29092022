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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
                  constraints: BoxConstraints.expand(),
                  child: Column(
                    children: [
                      Expanded(
                          child: Container(
                            color: Colors.red,
                            alignment: Alignment.center,
                            constraints: BoxConstraints.expand(),
                            child: Text("A")
                          )
                      ),
                      Expanded(
                          child: Container(
                            color: Colors.blue,
                            alignment: Alignment.center,
                            constraints: BoxConstraints.expand(),
                            child: Text("B"),
                          )
                      ),
                      Expanded(
                          child: Container(
                            color: Colors.green,
                            alignment: Alignment.center,
                            constraints: BoxConstraints.expand(),
                            child: Text("C"),
                          )
                      ),
                      Expanded(
                          child: Container(
                            color: Colors.orange,
                            alignment: Alignment.center,
                            constraints: BoxConstraints.expand(),
                            child: Text("D"),
                          )
                      )
                    ],
                  ),
                )
            ),
            Expanded(
                child: Container(
                  constraints: BoxConstraints.expand(),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                              color: Colors.red,
                              alignment: Alignment.center,
                              constraints: BoxConstraints.expand(),
                              child: Text("A")
                          )
                      ),
                      Expanded(
                          child: Container(
                            color: Colors.blue,
                            alignment: Alignment.center,
                            constraints: BoxConstraints.expand(),
                            child: Text("B"),
                          )
                      ),
                      Expanded(
                          child: Container(
                            color: Colors.green,
                            alignment: Alignment.center,
                            constraints: BoxConstraints.expand(),
                            child: Text("C"),
                          )
                      ),
                      Expanded(
                          child: Container(
                            color: Colors.orange,
                            alignment: Alignment.center,
                            constraints: BoxConstraints.expand(),
                            child: Text("D"),
                          )
                      )
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}


