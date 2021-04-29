import 'package:flutter/material.dart';
import 'package:midterm1/screens/add_screen.dart';
import 'package:midterm1/screens/clothes_details_screen.dart';
import 'package:midterm1/screens/edit_details_screen.dart';
import 'package:midterm1/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        ClothesDetailsScreen.routeName: (ctx) => ClothesDetailsScreen(),
        AddScreen.routeName: (ctx) => AddScreen(),
        EditDetailsScreen.routeName: (ctx) => EditDetailsScreen(),
      }
      ,
    );
  }
}
