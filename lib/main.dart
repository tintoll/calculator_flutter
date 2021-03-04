import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '계산기',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalculatorFlutter(),
    );
  }
}

class CalculatorFlutter extends StatefulWidget {
  @override
  _CalculatorFlutterState createState() => _CalculatorFlutterState();
}

class _CalculatorFlutterState extends State<CalculatorFlutter> {
  var _sum;
  var _edit1Controller = TextEditingController();
  var _edit2Controller = TextEditingController();

  var _buttonText;
  var _buttonList = ['더하기', '빼기', '나누기', '곱하기'];
  List<DropdownMenuItem> _menuItems;

  @override
  void initState() {
    super.initState();
    _menuItems = _buttonList
        .map((item) => DropdownMenuItem(
              child: Text(item),
              value: item,
            ))
        .toList();
    _buttonText = _menuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('계산기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Center(
            child: Column(
              children: [
                Text('결과 : $_sum'),
                TextField(
                  controller: _edit1Controller,
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _edit2Controller,
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {

                        var value1 = double.parse(_edit1Controller.text);
                        var value2 = double.parse(_edit2Controller.text);
                        var result;

                        if(_buttonText == '더하기') {
                          result = value1 + value2;
                        } else if(_buttonText == '빼기') {
                          result = value1 - value2;
                        }  else if(_buttonText == '나누기') {
                          result = value1 / value2;
                        }  else if(_buttonText == '곱하기') {
                          result = value1 * value2;
                        }
                        _sum = '$result';
                      });
                    },
                    child: Row(
                      children: [Icon(Icons.add), Text('$_buttonText')],
                    ),
                  ),
                ),
                DropdownButton(
                  items: _menuItems,
                  onChanged: (value) {
                    setState(() {
                      _buttonText = value;
                    });
                  },
                  value: _buttonText,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
