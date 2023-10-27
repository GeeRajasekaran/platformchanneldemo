import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FetchBatteryInfoWidget extends StatefulWidget {
  const FetchBatteryInfoWidget({super.key});

  @override
  State<FetchBatteryInfoWidget> createState() => _FetchBatteryInfoWidgetState();
}

class _FetchBatteryInfoWidgetState extends State<FetchBatteryInfoWidget> {

  // Create a channel
  static const channelName = 'BATTERY_INFO';
  static const batteryChannel = MethodChannel(channelName);

  String batteryLevel = "--";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(batteryLevel),
          ElevatedButton(
            child: const Text("Check battery info"),
            onPressed: () {
              getBatteryLevel();
            },
          )
        ],
      ),
    );
  }

  void getBatteryLevel() async {
    
    final int newBatteryLevel =
        await batteryChannel.invokeMethod("batterymethod");

    setState(() {
      batteryLevel = "$newBatteryLevel%";
    });
  }
}
