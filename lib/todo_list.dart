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

  @override
  void initState() {
    arrPerson = [];
    mapRender = {
      "isOpenForm": false,
      "inputName": "",
      "inputAge": "",
      "inputAddress": "",
    };
    super.initState();
  }

  void showMessageSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void insertPerson(String name, String age, String address, List<Map<String, dynamic>> arrPerson, VoidCallback onInsertFinish) {
    if (name.isEmpty || age.isEmpty || address.isEmpty) {
      showMessageSnackBar("Thông tin chưa đầy đủ");
      return;
    }
    setState((){
      arrPerson.add({"name": name, "age": age, "address": address});
      onInsertFinish();
      showMessageSnackBar("Thêm người dùng mới thành công");
    });
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
            _shouldShowForm(mapRender, arrPerson),
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

  Widget _shouldShowForm(Map<String, dynamic> mapRender, List<Map<String, dynamic>> arrPerson) {
    Widget widget;
    if (mapRender["isOpenForm"]) {
      widget = _formWidget(mapRender, arrPerson, context);
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
    List<Map<String, dynamic>> arrPerson,
    BuildContext context
  ) {
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    return Card(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _textFormWidget("Input Name", nameController, mapRender: mapRender, inputKey: "inputName"),
            SizedBox(height: 10),
            _textFormWidget("Input Age", ageController, mapRender: mapRender, inputKey: "inputAge"),
            SizedBox(height: 10),
            _textFormWidget("Input Address", addressController, mapRender: mapRender, inputKey: "inputAddress"),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buttonWidget(
                    "Add Word",
                    Colors.green,
                    onTap: (){
                      String inputName = mapRender["inputName"];
                      String inputAge = mapRender["inputAge"];
                      String inputAddress = mapRender["inputAddress"];
                      // Call back function: Tự implement logic của widget
                      insertPerson(
                        inputName,
                        inputAge,
                        inputAddress,
                        arrPerson,
                        () {
                          nameController.clear();
                          ageController.clear();
                          addressController.clear();
                          mapRender["isOpenForm"] = !mapRender["isOpenForm"];
                        }
                      );
                    }
                ),
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

  Widget _textFormWidget(String hint, TextEditingController controller,{Map<String, dynamic>? mapRender, String inputKey = ""}) {
    return TextField(
      maxLength: 50,
      maxLines: 1,
      controller: controller,
      onChanged: (text) {
        if (mapRender != null) mapRender[inputKey] = text;
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


