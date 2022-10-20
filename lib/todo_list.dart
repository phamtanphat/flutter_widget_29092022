import 'package:flutter/material.dart';
class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TodoListContainer();
  }
}

class _TodoListContainer extends StatefulWidget {
  const _TodoListContainer({Key? key}) : super(key: key);

  @override
  State<_TodoListContainer> createState() => _TodoListContainerState();
}

class _TodoListContainerState extends State<_TodoListContainer> {

  late List<Map<String, dynamic>> arrPerson;

  @override
  void initState() {
    arrPerson = [
      {"name": "Teo", "age": 10, "address": "Quan 1"},
      {"name": "Ti", "age": 15, "address": "Quan 2"},
      {"name": "Tun", "age": 20, "address": "Quan 3"},
      {"name": "Tuan", "age": 25, "address": "Quan 4"},
      {"name": "Hoa", "age": 30, "address": "Quan 5"},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            _formWidget(context),
            Flexible(
              child: ListView.builder(
                  itemCount: arrPerson.length,
                  itemBuilder: (context, position){
                    String name = arrPerson[position]["name"];
                    String age = arrPerson[position]["age"].toString();
                    String address = arrPerson[position]["address"];
                    return _itemListView(name, age, address);
                  }
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget _formWidget(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 240, 240, 240),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField()
          ],
        )
      ),
    );
  }

  Widget _itemListView(String name, String age, String address) {
    return Card(
      child: ListTile(
        title: Text(
            "Tên: $name",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
        ),
        subtitle: Text(
            "Tuổi: $age\nĐịa chỉ: $address",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete ,color: Colors.red),
          onPressed: () {

          },
        ),
      ),
    );
  }
}


