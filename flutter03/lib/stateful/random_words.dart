import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});
  @override
  State<RandomWords> createState() => _RandomWords();
}

class _RandomWords extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  // 這裡要新增一個 array 來放被添加另一個狀態的 item (範例是"加入最愛")
  final _saved = <WordPair>{}; // 這邊用 Set 做 data type，其目的在於該 array 不允許重複 item

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      // imageBuilder 是一個 callback 會在條件符合時被 call (在 index 大於或等於 0 且小於 itemCount 時被 call)
      itemBuilder: (context, i) {
        if(i.isOdd) return const Divider(color: Colors.deepPurple,);

        final index = i ~/ 2;

        if(index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        // 新增一個變數控制已經被加入最愛的狀態
        final alreadySaved = _saved.contains(_suggestions[index]);

        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
          trailing: Icon(
            // 判斷 alreadySaved 變數有沒有值，有的畫就調整 icon 圖示變成 .favorite 沒有就 .favorite_border
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            // 判斷 alreadySaved 變數有沒有值，有的話就調整顏色
            color: alreadySaved ? Colors.red : null,
            // 一樣判斷，若有就顯示提示字 remove from saved 沒有的話就提示 Save
            semanticLabel: alreadySaved ? 'Remove from saved' : 'Save' ,
            ),
          onTap: () {
            setState(()
              {
                if(alreadySaved) 
                {
                  _saved.remove(_suggestions[index]);
                } 
                else 
                {
                  _saved.add(_suggestions[index]);
                }              
              }
            );
          },
        );
      },
    );
  }
}