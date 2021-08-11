import 'package:contador/src/pages/Home_page.dart';
import 'package:contador/src/pages/contador_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //para quitar el banner debug
      home: Center(
        //centrar el texto
        child: ContadorPage(),
      ),
    );
  }
}
