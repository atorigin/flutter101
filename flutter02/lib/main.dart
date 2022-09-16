
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'stateful/RandomWords.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // 將父類別 StatelessWidget 的 key 定義為常數
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { // BuildContext 是一個 Widget 處理器，它控管該 Widget 在整個 Widget tree 下的位置
    // 新增 WordPair 亂數生成英文字
    // final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          //child: Text('Hello World'),
          child: RandomWords(),
        ),
      ),
    );
  }
}