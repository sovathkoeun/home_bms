import 'package:api_user/user.dart';
import 'package:flutter/material.dart';

void main() => runApp(Home());
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Users(),
    );
  }
}
