import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  // 可以看見 RandomWords 會 override 父類別的 createState() 方法
  // 這邊的語法可以解讀為 RandomWords 在呼叫 createState() 方法後，會回傳 _RandomWords 物件，該物件 type 是 State<RandomWords>
  // 原碼裡面寫到，createState 方法在整個 widget 的 lifetime 裡面可以一直被呼叫
  @override
  State<RandomWords> createState() => _RandomWords();
}

// underscore(_) 代表 class 是私有的，它被用來作為在定義 State 物件的時候最佳建議
class _RandomWords extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}