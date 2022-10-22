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
  late Map<String, dynamic> mapRender;
  late String inputName, inputAge, inputAddress;

  @override
  void initState() {
    arrPerson = [
      {"name": "Teo", "age": 10, "address": "Quan 1"},
      {"name": "Ti", "age": 15, "address": "Quan 2"},
      {"name": "Tun", "age": 20, "address": "Quan 3"},
      {"name": "Tuan", "age": 25, "address": "Quan 4"},
      {"name": "Hoa", "age": 30, "address": "Quan 5"},
    ];
    inputName = inputAge = inputAddress = "";
    mapRender = {
      "isOpenForm": false
    };
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
            _shouldShowForm(
                mapRender,
                inputName: inputName,
                inputAge: inputAge,
                inputAddress: inputAddress
            ),
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

  Widget _shouldShowForm(Map<String, dynamic> mapRender, {String? inputName, String? inputAge, String? inputAddress}) {
    Widget widget;
    if (mapRender["isOpenForm"]) {
      widget = _formWidget(
          mapRender,
          context,
          inputName: inputName,
          inputAge: inputAge,
          inputAddress: inputAddress,
      );
    } else {
      widget = _buttonWidget(
          "+",
          Colors.green,
          verticalPadding: 15,
          horizontalPadding: 170,
          onTap: () {
            setState(() {
              mapRender["isOpenForm"] = true;
            });
          }
      );
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: widget,
    );
  }

  Widget _formWidget(
    Map<String, dynamic> mapRender,
    BuildContext context,
      {
        String? inputName,
        String? inputAge,
        String? inputAddress,
      }
  ) {
    return Card(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _textFormWidget("Input Name", input: inputName),
            SizedBox(height: 10),
            _textFormWidget("Input Age", input: inputAge),
            SizedBox(height: 10),
            _textFormWidget("Input Address", input: inputAddress),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buttonWidget("Add Word", Colors.green),
                _buttonWidget(
                    "Cancel",
                    Colors.red,
                    onTap: () {
                      setState((){
                        mapRender["isOpenForm"] = false;
                      });
                    }
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        )
      ),
    );
  }

  Widget _buttonWidget(
      String textButton,
      Color color,
      {
        double? verticalPadding,
        double? horizontalPadding,
        Function()? onTap
      }
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
                Radius.circular(5.0)
            ),
        ),
        padding: EdgeInsets.symmetric(vertical: verticalPadding ??= 20, horizontal: horizontalPadding ??= 40),
        child: Text(
          textButton,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _textFormWidget(String hint, {String? input}) {
    return TextField(
      maxLength: 50,
      maxLines: 1,
      onChanged: (text) {
        if (input != null) input = text;
      },
      decoration: InputDecoration(
        counterText: "",
        fillColor: Colors.white,
        filled: true,
        hintText: hint,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1)
        ),
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


