import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeCodeScreen extends StatefulWidget {
  @override
  State<NativeCodeScreen> createState() => _NativeCodeScreenState();
}

class _NativeCodeScreenState extends State<NativeCodeScreen> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  String batteryLevel = 'Unknown battery level.';

  void _getBatteryLevel()  {
    platform.invokeMethod('getBatteryLevel').then((value) {

      setState(() {
        batteryLevel = 'Battery level at $value % .';
      });

    }).catchError((e){
      setState(() {
        batteryLevel = "Failed to get battery level: '${e.message}'.";
      });

    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _getBatteryLevel,
              child: const Text('Get Battery Level'),
            ),
            Text(batteryLevel),
          ],
        ),
      ) ,
    );
  }
}
