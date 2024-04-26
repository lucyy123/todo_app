// ignore_for_file: prefer_const_constructors, unnecessary_import
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/pages/homepage.dart';

void main() async {
//* init the hive
  await Hive.initFlutter();

//? create a hive box

  var box = await Hive.openBox("myBox");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: MyHomepage(),
      // theme: ThemeData(
      //     primarySwatch: Colors
      //         .grey), //? ----------- TO CHANGE THE DEFULT COLOUR FOR THE APP BAR -------------------/
    );
  }
}
