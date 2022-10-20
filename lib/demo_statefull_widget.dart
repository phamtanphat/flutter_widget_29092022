import 'package:flutter/material.dart';
// Widget
class DemoStatefullPage extends StatefulWidget {
  const DemoStatefullPage({Key? key}) : super(key: key);

  @override
  State<DemoStatefullPage> createState() => _DemoStatefullPageState();
}

// state object
class _DemoStatefullPageState extends State<DemoStatefullPage> {
  int a = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Khi nao se duoc goi
  }

  @override
  void didUpdateWidget(covariant DemoStatefullPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Khi nao se duoc goi
  }

  @override
  void dispose() {
    super.dispose();
    // Khi nao se duoc goi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo StateFull"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Value : $a"),
            ElevatedButton(
                onPressed: (){
                  setState((){
                    a++;
                  });
                },
                child: Text("Increase")
            )
          ],
        ),
      ),
    );
  }
}
