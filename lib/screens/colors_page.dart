import 'package:flutter/material.dart';
import 'package:toku_learning_app/models/number.dart';
import 'package:audioplayers/audioplayers.dart';

class Colours extends StatelessWidget {
  final List<Number> colours = [
    Number(
      image: "assets/images/colors/color_black.png",
      EnName: "black",
      JpName: "kuro",
      sound: "sounds/colors/black.wav",
      color: Color(0xff7E40A3),
    ),
    Number(
      image: "assets/images/colors/color_brown.png",
      EnName: "brown",
      JpName: "chairo",
      sound: "sounds/colors/brown.wav",
      color: Color(0xff7E40A3),
    ),
    Number(
      image: "assets/images/colors/color_dusty_yellow.png",
      EnName: "dusty yellow",
      JpName: "kusunda kiiro",
      sound: "sounds/colors/dusty yellow.wav",
      color: Color(0xff7E40A3),
    ),
    Number(
      image: "assets/images/colors/color_gray.png",
      EnName: "gray",
      JpName: "haiiro",
      sound: "sounds/colors/gray.wav",
      color: Color(0xff7E40A3),
    ),
    Number(
      image: "assets/images/colors/color_green.png",
      EnName: "green",
      JpName: "midori",
      sound: "sounds/colors/green.wav",
      color: Color(0xff7E40A3),
    ),
    Number(
      image: "assets/images/colors/color_red.png",
      EnName: "red",
      JpName: "aka",
      sound: "sounds/colors/red.wav",
      color: Color(0xff7E40A3),
    ),
    Number(
      image: "assets/images/colors/yellow.png",
      EnName: "yellow",
      JpName: "kiiro",
      sound: "sounds/colors/yellow.wav",
      color: Color(0xff7E40A3),
    ),
    Number(
      image: "assets/images/colors/color_white.png",
      EnName: "white",
      JpName: "shiro",
      sound: "sounds/colors/white.wav",
      color: Color(0xff7E40A3),
    ),
  ];

  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF4DA),
      appBar: AppBar(
        title: const Text(
          "Colors",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff673AB7),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: colours.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(colours[index].image!),
                ),
                title: Text(
                  colours[index].JpName!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  colours[index].EnName!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    audioPlayer.play(AssetSource(colours[index].sound!));
                  },
                  icon: Icon(
                    Icons.play_arrow,
                    color: colours[index].color,
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
