import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'method_channel.dart';
import 'event_channel.dart';

void main() async {
  //channel name
  WidgetsFlutterBinding.ensureInitialized();
   const platform = const MethodChannel('samples.flutter.dev/battery');
   final int result = await platform.invokeMethod('getHeightPixels');
   print(result.toString() + "____________________");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Platform Channel Demo',
      home: MethodChannelDemo(),
    );
  }
}

