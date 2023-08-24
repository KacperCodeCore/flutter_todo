import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/home_page.dart';
import 'package:flutter_todo/theme/my_app_theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //initialize the hive
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox('myBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ToDo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomePage(),
    );
  }
}
