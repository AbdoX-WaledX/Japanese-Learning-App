import 'package:flutter/material.dart';
import 'package:toku_learning_app/models/PhraseModel.dart';
import 'package:audioplayers/audioplayers.dart';

class PhrasePage extends StatelessWidget {
  final List<pharo> words = [
    pharo(
      EnName: "Are You Coming",
      JpName: "Anata wa kimasu ka",
      sound: "sounds/phrases/are_you_coming.wav",
    ),
    pharo(
      EnName: "Don't forget to subscribe",
      JpName: "Channeru tōroku o wasurenaide kudasai",
      sound: "sounds/phrases/dont_forget_to_subscribe.wav",
    ),
    pharo(
      EnName: "How are you feeling",
      JpName: "Kibun wa dō desu ka?",
      sound: "sounds/phrases/how_are_you_feeling.wav",
    ),
    pharo(
      EnName: "I love anime",
      JpName: "Anime ga daisuki desu",
      sound: "sounds/phrases/i_love_anime.wav",
    ),
    pharo(
      EnName: "I love programming",
      JpName: "Puroguramingu ga daisuki desu",
      sound: "sounds/phrases/i_love_programming.wav",
    ),
    pharo(
      EnName: "Programming is easy",
      JpName: "Puroguramingu wa kantan desu",
      sound: "sounds/phrases/programming_is_easy.wav",
    ),
    pharo(
      EnName: "What is your name",
      JpName: "Anata no namae wa nan desu ka",
      sound: "sounds/phrases/what_is_your_name.wav",
    ),
    pharo(
      EnName: "Where are you going",
      JpName: "Doko ni iku no desu ka",
      sound: "sounds/phrases/where_are_you_going.wav",
    ),
    pharo(
      EnName: "Yes, I'm coming",
      JpName: "Hai, ikimasu",
      sound: "sounds/phrases/yes_im_coming.wav",
    ),
  ];

  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE3F2FD),
      appBar: AppBar(
        backgroundColor: const Color(0xff673AB7),
        title: const Text(
          "Phrases",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: words.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: Text(
                  words[index].JpName!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  words[index].EnName!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    audioPlayer.play(AssetSource(words[index].sound!));
                  },
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Color(0xff673AB7),
                    size: 30,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
