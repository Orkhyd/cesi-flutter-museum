import 'package:flutter/material.dart';

class MuseumApp extends StatelessWidget {
  const MuseumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "museum", // in logical pixels
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 93, 255, 212)),
      home: const Artwork(),
    );
  }
}

class Artwork extends StatelessWidget {
  const Artwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 168, 141, 53),
          title: const Text('Museum'),
        ),
        body: Column(children: [
          Center(
              child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset("assets/images/Mona_Lisa.jpg"),
              const Icon(Icons.favorite,
                  size: 100, color: Color.fromARGB(190, 255, 255, 255))
            ],
          )),
          const Text(
            "Joe Condominium",
            style: TextStyle(
                fontFamily: "Merriweather", fontSize: 30, color: Colors.brown),
          ),
          const Text(
            "Da Vinki",
            style: TextStyle(
                fontFamily: "Merriweather",
                fontSize: 15,
                color: Colors.brown,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [Icon(Icons.article), Icon(Icons.favorite)],
          )
        ])
        // floatingActionButton: const FloatingActionButton(
        //     backgroundColor: Color.fromARGB(255, 255, 7, 7), onPressed: null)
        );
  }
}

void main() {
  runApp(
    const MuseumApp(),
  );
}
