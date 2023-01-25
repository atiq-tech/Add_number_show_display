import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  TextEditingController _fisrtNumController = TextEditingController();
  TextEditingController _secondNumController = TextEditingController();
  TextEditingController _thirdNumController = TextEditingController();

  int? result = 00;
  int? sum;

  String name = "";

  @override
  void dispose() {
    _fisrtNumController.dispose();
    _secondNumController.dispose();
    _thirdNumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Add Two Numbers",
                style: TextStyle(fontSize: 30, color: Colors.black)),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: _fisrtNumController,
              decoration: InputDecoration(
                  labelText: "Enter First Number",
                  labelStyle:
                      TextStyle(fontSize: 15, color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  name = value.toString();
                });
              },
              controller: _secondNumController,
              decoration: InputDecoration(
                  labelText: "Enter 2nd Number",
                  labelStyle:
                      TextStyle(fontSize: 15, color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: _thirdNumController,
              decoration: InputDecoration(
                  labelText: "Get Total Number",
                  labelStyle:
                      TextStyle(fontSize: 15, color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 15,
            ),
            Text("Total: ${result.toString().padLeft(2, "0")}",
                style: TextStyle(fontSize: 30, color: Colors.black)),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            sum = int.parse(_fisrtNumController.text) +
                int.parse(_secondNumController.text);
            result = sum;
            _thirdNumController.text = result.toString();
          });
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Container(
                  height: 120.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("first input number:${_fisrtNumController.text}"),
                      Text("2nd input number:${_secondNumController.text}"),
                      Text("Get Total number:${_thirdNumController.text}"),
                    ],
                  ),
                ),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: Text(
          "Add",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
