import 'dart:ui';

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

class Artwork extends StatefulWidget {
  const Artwork({super.key});

  @override
  State<Artwork> createState() => _ArtworkState();
}

class _ArtworkState extends State<Artwork> {
  bool _isFavorite = false;
  bool _showDescription = false;
  final snackBar = const SnackBar(
      duration: Duration(seconds: 2),
      content: Text('Oeuvre ajoutée à vos favoris'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 168, 141, 53),
          title: const Text('Museum'),
        ),
        body: Column(children: [
          // const SnackBarPage(),

          Center(
            child: SizedBox(
                height: 610,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage('assets/images/Mona_Lisa.jpg')),
                          ),
                        ),
                        BackdropFilter(
                          filter: _showDescription
                              ? ImageFilter.blur(sigmaX: 20, sigmaY: 0)
                              : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                          child: Container(
                            color: Colors.black.withOpacity(
                                0), // This is necessary for the blur effect to be applied
                          ),
                        )
                      ],
                    ),
                    !_showDescription
                        ? Icon(Icons.favorite,
                            size: 100,
                            color: _isFavorite
                                ? Colors.red
                                : const Color.fromARGB(190, 255, 255, 255))
                        : const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 50),
                            child: SingleChildScrollView(
                              child: Text(
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                  textAlign: TextAlign.justify,
                                  "La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 1516 1,2, et peut-être jusqu'à 1517 (l'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci. La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par ce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau l’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au monde. Au xxie siècle, elle est devenue l'objet d'art le plus visité au monde, devant le diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier quotidiennement."),
                            ))
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                const Text(
                  "La Joconde",
                  style: TextStyle(
                      fontFamily: "Merriweather",
                      fontSize: 30,
                      color: Colors.brown),
                ),
                const Text(
                  "Leonardo Da Vinci",
                  style: TextStyle(
                      fontFamily: "Merriweather",
                      fontSize: 15,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // children: const [Icon(Icons.article), Icon(Icons.favorite)],
                  children: [
                    IconButton(
                      onPressed: () => setState(() {
                        _showDescription = !_showDescription;
                      }),
                      icon: const Icon(Icons.article),
                      color: Colors.brown,
                    ),
                    IconButton(
                        onPressed: () => setState(() {
                              if (!_isFavorite) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                              _isFavorite = !_isFavorite;
                            }),
                        icon: Icon(Icons.favorite,
                            color: _isFavorite ? Colors.red : Colors.brown)),
                  ],
                ),
              ],
            ),
          )
        ]));
  }
}

void main() {
  runApp(
    const MuseumApp(),
  );
}
