import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hello',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Welcome to Flutter'),
          ),
          body: Center(child: RandomWords()),
        ));
  }
}

class RandomWords extends StatefulWidget {
  RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final suggestions = <WordPair>[];
  final saved = <WordPair>[];
  final biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, i) {
      Padding:
      const EdgeInsets.all(16.0);
      if (i.isOdd) return const Divider();
      final index = i ~/ 2;
      if (index >= suggestions.length) {
        suggestions.addAll(generateWordPairs().take(10));
      }
      final alreadySaved = saved.contains(suggestions[index]);
      return ListTile(
        title: Text(
          suggestions[index].asPascalCase,
          style: biggerFont,
        ),
        trailing: Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
          semanticLabel: alreadySaved ? 'Remove from saved' : 'saved',
        ),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              saved.remove(suggestions[index]);
            } else {
              saved.add(suggestions[index]);
            }
          });
        },
      );
    });
  }
}
