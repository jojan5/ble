import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class ControlScreen extends StatefulWidget {
  final BluetoothCharacteristic characteristic;
  ControlScreen(this.characteristic);

  @override
  ControlScreenState createState() {
    return new ControlScreenState();
  }
}

class ControlScreenState extends State<ControlScreen> {
  @override
  void writeString(String str) async {
    await widget.characteristic.write(utf8.encode(str));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            textColor: Colors.white,
            color: Color(0xFF6200EE),
            onPressed: () {
              writeString("upp\n");
            },
            child: Text('ARRIBA'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                textColor: Colors.white,
                color: Color(0xFF6200EE),
                onPressed: () {
                  writeString("mok\n");
                },
                child: Text('MENU/OK'),
              ),
              Image(
                image: AssetImage('assets/puritec.png'),
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Color(0xFF6200EE),
                onPressed: () {
                  writeString("scr\n");
                },
                child: Text('EXIT/CANCEL'),
              ),
            ],
          ),
          RaisedButton(
            textColor: Colors.white,
            color: Color(0xFF6200EE),
            onPressed: () {
              writeString("dwn\n");
            },
            child: Text('ABAJO'),
          ),
        ],
      ),
    );
    // Container(
    //     color: Colors.white,
    //     child: Center(
    //         child: Stack(
    //       children: <Widget>[
    //         Positioned(
    //           top: 100,
    //           left: 100,
    //           child: RaisedButton(
    //             textColor: Colors.white,
    //             color: Color(0xFF6200EE),
    //             onPressed: () {
    //               writeString("mok");
    //             },
    //             child: Text('MENU/OK'),
    //           ),
    //         ),
    //         Positioned(
    //           top: 100,
    //           left: 100,
    //           child: RaisedButton(
    //             textColor: Colors.white,
    //             color: Color(0xFF6200EE),
    //             onPressed: () {
    //               writeString("scr");
    //             },
    //             child: Text('EXIT/CANCEL'),
    //           ),
    //         ),
    //         Positioned(
    //           top: 100,
    //           left: 100,
    //           child: RaisedButton(
    //             textColor: Colors.white,
    //             color: Color(0xFF6200EE),
    //             onPressed: () {
    //               writeString("dwn");
    //             },
    //             child: Text('ABAJO'),
    //           ),
    //         ),
    //         Positioned(
    //           top: 100,
    //           left: 100,
    //           child: RaisedButton(
    //             textColor: Colors.white,
    //             color: Color(0xFF6200EE),
    //             onPressed: () {
    //               writeString("upp");
    //             },
    //             child: Text('ARRIBA'),
    //           ),
    //         )
    //       ],
    //     )));
  }
}
