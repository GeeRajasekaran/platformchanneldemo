import 'package:flutter/material.dart';
import 'package:platform_channel_demo/battery_info_widget.dart';
import 'package:platform_channel_demo/network_stream_widget.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter platform channel demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const _MyHomePage(title: 'Events and method Channel Demo'),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  final String title;

  const _MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Column(
        children: [
          NetworkStreamWidget(),
          SizedBox(
            height: 200,
          ),
          FetchBatteryInfoWidget(),
        ],
      ),
    );
  }
}
