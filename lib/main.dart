import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/Projects/today_news_app/lib/screens/home_page.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "News App",
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}
