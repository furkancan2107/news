import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.newspaper_sharp),
            backgroundColor: Color.fromARGB(255, 253, 156, 12).withOpacity(0.6),
            title: Text(
              'Rf Haber(Türkiye Trendleri)',
              style: TextStyle(
                  color: Color.fromARGB(255, 240, 240, 240),
                  fontStyle: FontStyle.normal),
            ),
          ),
          body: HomePage()),
    );
  }
}
