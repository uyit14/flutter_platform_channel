import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventChannelDemo extends StatefulWidget {
  @override
  _EventChannelDemoState createState() => _EventChannelDemoState();
}

class _EventChannelDemoState extends State<EventChannelDemo> {
  static const _event = const EventChannel('samples.flutter.dev/internet');

  bool _internetConnection = false;

  void _checkInternetConnection(){
    _event.receiveBroadcastStream().listen((event) {
      setState(() {
        _internetConnection = event;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    _checkInternetConnection();
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Channel'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Internet connection', style: TextStyle(fontSize: 34),),
              SizedBox(
                width: 8,
              ),
              Icon(
                _internetConnection ? Icons.cast_connected : Icons.not_interested,
                color: _internetConnection ? Colors.green : Colors.red,
                size: 54,
              )
            ],
          ),
        ),
      ),
    );
  }
}
