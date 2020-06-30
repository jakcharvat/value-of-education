import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  runApp(MyApp());
}

class AppWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLight = true;

  final lightTheme = ThemeData(brightness: Brightness.light);

  final darkTheme = ThemeData(brightness: Brightness.dark);

  ThemeData get theme => _isLight ? lightTheme : darkTheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Value of Education',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: Scaffold(
        body: App(_toggleTheme),
      ),
    );
  }

  void _toggleTheme() {
    setState(() => _isLight = !_isLight);
  }
}
