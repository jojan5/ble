import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class ReadScreen extends StatefulWidget {
  final BluetoothCharacteristic characteristic;
  ReadScreen(this.characteristic);

  @override
  ReadScreenState createState() {
    return new ReadScreenState();
  }
}

class ReadScreenState extends State<ReadScreen> {
  String readStr = "";

  @override
  void initState() {
    super.initState();
    _setNotification();
  }

  @override
  void _setNotification() async {
    await widget.characteristic.setNotifyValue(true);
    widget.characteristic.value.listen((value) {
      setState(() {
        readStr = utf8.decode(value).toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.pink,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.album, size: 70),
              title: Text(readStr, style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
