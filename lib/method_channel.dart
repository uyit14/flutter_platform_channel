import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

import 'event_channel.dart';


class MethodChannelDemo extends StatefulWidget {
  @override
  _MethodChannelDemoState createState() => _MethodChannelDemoState();
}

class _MethodChannelDemoState extends State<MethodChannelDemo> {
  //channel name
  static const platform = const MethodChannel('samples.flutter.dev/battery');

  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Method Channel'),
        actions: <Widget>[
          FlatButton(
            child: Text("Go to EventChannel"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => EventChannelDemo()));
            },
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                child: Text('Get Battery Level', style: TextStyle(fontSize: 34),),
                onPressed: _getBatteryLevel,
              ),
              Text(_batteryLevel, style: TextStyle(fontSize: 34),),
            ],
          ),
        ),
      ),
    );
  }
}
