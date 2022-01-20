import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:healthhutplugin/healthhutplugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

final String userIdDic ='{"userId":"cabcd2df4125f6f591f4bc5c39211ba5429e36f3"}';
  // Platform messages are asynchronous, so we initialize in an async method.
Future<void> _goToHealthHutModular() async {
  try {
    String? ocrResult = await Healthhutplugin().jumpHealthHut(userIdDic);
    print(ocrResult);
  } catch (e) {
    print(e);
  }
}
  @override


  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: FlatButton(
            onPressed:() {
              _goToHealthHutModular();
            },
            child:Text('跳转健康小屋',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 13,
              ),
            )


          ),
        ),
      ),
    );
  }
}
