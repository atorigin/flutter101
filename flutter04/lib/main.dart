import 'package:flutter/material.dart';
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
        body: Column(
          children: [
            titleSection,
          ],
        )
      )
    );
  }
}