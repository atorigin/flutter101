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

  // 新增一個 push func
  void _pushSaved() {
  Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (context) {
        final tiles = _saved.map(
          (pair) {
            return ListTile(
              title: Text(
                pair.asPascalCase,
                style: _biggerFont
              ),
            );
          }
        );
        
        final divided = tiles.isNotEmpty ? ListTile.divideTiles(tiles: tiles, context: context).toList() : <Widget>[];
      
        return Scaffold(
          appBar: AppBar(
            title: const Text("Saved Suggestions"),
            ),
          body: ListView(children: divided),
          );
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Startup Name Generator"),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            // 這邊 onPressed 要一個 callback function (很怪，目前沒辦法完全理解)
            onPressed: () => _pushSaved(),
            tooltip: 'Saved Suggestions',
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(30.0),
        // ListView 的 itemBuilder 是一個回呼函數，他僅針對那些可以被看到的地方進行 callback 來重新 build 出可見 item
        itemBuilder: (context, i) {
          if(i.isOdd) return const Divider(color: Colors.deepPurple,);
          
          final index = i ~/ 2;
        
          if(index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          final alreadySaved = _saved.contains(_suggestions[index]);
          
          return ListTile(
            title: Text(
              _suggestions[index].asPascalCase,
              style: _biggerFont,
            ),
            trailing: Icon(
              alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: alreadySaved ? Colors.red : null,
              semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
            ),
            onTap: () {
              setState(
                () {
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
        }
      )
    );
  }
}