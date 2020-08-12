import 'package:flutter/material.dart';
import 'package:prueba_flutter/src/pages/comments.dart';

import 'package:prueba_flutter/src/pages/home.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'PostsApp',
      initialRoute: '/',
      routes: {
        '/'        : (BuildContext context) => Home(),
        'comments' : (BuildContext context) => Comments()
      },
    );
  }
}