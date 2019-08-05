import 'package:class_project/provider.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: Auth(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: SplashScreen(),
      ),
    );
  }
}

