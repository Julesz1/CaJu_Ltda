 // ignore_for_file: prefer_const_constructors

 import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:projeto07/pages/login.dart';
 
void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}
 
class MainApp extends StatelessWidget {
  const MainApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
