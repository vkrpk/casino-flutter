import 'dart:math';

import 'package:flutter/material.dart';

List<String> images = [
  'images/bar.png',
  'images/cerise.png',
  'images/cloche.png',
  'images/diamant.png',
  'images/fer-a-cheval.png',
  'images/pasteque.png',
  'images/sept.png',
];

final _random = Random();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Casino',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Casino'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message = '';

  void play () {
    setCurrentImages();
    bool everyValueIsEmpty = currentImages.every((item) => item.image.toString() == currentImages[0].image.toString());
    setMessage(everyValueIsEmpty);
  }

  List<Image> currentImages = [
    Image.asset(images[_random.nextInt(images.length)]),
    Image.asset(images[_random.nextInt(images.length)]),
    Image.asset(images[_random.nextInt(images.length)]),
  ];

  void setMessage(state) {
    setState(() {
      _message = state ? 'Jackpot' : 'You lost, try again !';
    });
  }

  void setCurrentImages() {
    setState(() {
      currentImages[0] = Image.asset(images[_random.nextInt(images.length)]);
      currentImages[1] = Image.asset(images[_random.nextInt(images.length)]);
      currentImages[2] = Image.asset(images[_random.nextInt(images.length)]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: currentImages,
            ),
            Text(_message, style: const TextStyle(height: 5, fontSize: 50), )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
          onPressed: () => play(),
          child: const Icon(Icons.autorenew)
      ),
    );
  }
}
