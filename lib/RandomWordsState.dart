import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/RandomWords.dart';

class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved(){
    Navigator.of(context).push(
      new MaterialPageRoute(
          builder: (context){
            final tiles = _saved.map(
                (pair){
                  return new ListTile(
                    title: new Text(pair.asPascalCase,style: _biggerFont),
                  );
                }
            );

            final divided = ListTile.divideTiles(tiles: tiles,context:context).toList();

            return new Scaffold(
              appBar: new AppBar(
                title: new Text('Saved Suggestions'),
              ),
              body: new ListView(children: divided),
            );
          })
    );
  }
  
  Widget _buildSuggestions(){
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context,i){
            if(i.isOdd){
                return new Divider();
            }
            // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
            // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
            final index = i ~/ 2;
            if(index >= _suggestions.length){
                _suggestions.addAll(generateWordPairs().take(10));
            }

            return _buildRow(_suggestions[index]);
            
        },
    );
  }
  
  Widget _buildRow(WordPair wordPair){
    final hasSaved = _saved.contains(wordPair);
    return new ListTile(
        title: new Text(wordPair.asPascalCase,style: _biggerFont),
        trailing: new Icon(
            hasSaved ? Icons.favorite : Icons.favorite_border ,
            color: hasSaved ? Colors.red : null,
        ),
        onTap: (){
          // 在Flutter的响应式风格的框架中，
          // 调用setState() 会为State对象触发build()方法，从而导致对UI的更新
          //全量更新
          setState(() {
            if(hasSaved){
              _saved.remove(wordPair);
            }else{
              _saved.add(wordPair);
            }
          });
        },
    );
  }

}