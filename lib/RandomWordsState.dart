import 'package:english_words/english_words.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/RandomWords.dart';

class RandomWordsState extends State<RandomWords>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);
  }

}