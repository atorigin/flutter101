import 'package:flutter/material.dart';
import 'package:flutter04/widgets/button_row.dart';
import 'package:flutter04/widgets/text_section.dart';
import 'package:flutter04/widgets/title_row.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: Colors.white,
        // 整體頁面只有一個大 Column
        body: ListView(
          children: [
            Image.asset(
              'assets/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection(context),
            textSection
          ],
        )
      )
    );
  }
}