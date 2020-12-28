import 'package:flutter/material.dart';
import 'package:ble_arduino/pages/ble_control.dart';
import 'package:ble_arduino/pages/ble_read.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BleHome extends StatefulWidget {
  final BluetoothCharacteristic characteristic;
  BleHome(this.characteristic);

  @override
  _BleHomeState createState() => _BleHomeState();
}

class _BleHomeState extends State<BleHome> with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool showFab = true;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        showFab = true;
      } else {
        showFab = false;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BLE HM-10"),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              text: "Control",
            ),
            Tab(
              text: "OZONE",
            ),
          ],
        ),
        actions: <Widget>[
          Icon(Icons.search),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          Icon(Icons.more_vert)
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ControlScreen(widget.characteristic),
          ReadScreen(widget.characteristic),
        ],
      ),
    );
  }
}
