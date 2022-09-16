import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  // 可以看見 RandomWords 會 override 父類別的 createState() 方法
  // 這邊的語法可以解讀為 RandomWords 在呼叫 createState() 方法後，會回傳 _RandomWords 物件，該物件 type 是 State<RandomWords>
  // 原碼裡面寫到，createState 方法在整個 widget 的 lifetime 裡面可以一直被呼叫
  @override
  State<RandomWords> createState() => _RandomWords();
}

// Step5 創建 StatefulWidget 入門
// underscore(_) 代表 class 是私有的，它被用來作為在定義 State 物件的時候最佳建議
// class _RandomWords extends State<RandomWords> {
//   @override
//   Widget build(BuildContext context) {
//     final wordPair = WordPair.random();
//     return Text(wordPair.asPascalCase);
//   }
// }

// Step6 用 StatefulWidget 創建一個 ListView 可以無限上下滾動的清單
class _RandomWords extends State<RandomWords> {
  // 定義存放 english word 陣列
  final _suggestions = <WordPair>[];
  // 定義輸出字體大小
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    // 看起來 ListView 會自動感應 Client 裝置的上下界線 - 原理不清楚
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        // 如果 i 是奇數，返回一個分隔線 (Divider: 這是一個分隔線的樣式) https://api.flutter.dev/flutter/material/Divider-class.html
        if(i.isOdd) return const Divider();

        final index = i ~/ 2;

        if(index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
  }
}