import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:toku_learning_app/models/number.dart';

class NumbersPage extends StatefulWidget {
  @override
  State<NumbersPage> createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
  final List<Number> numbers = [
    Number(
      image: "assets/images/numbers/number_one.png",
      JpName: "ichi",
      EnName: "one",
      sound: "sounds/numbers/number_one_sound.mp3",
      color: Color(0xffEBA21D),
    ),
    Number(
      image: "assets/images/numbers/number_two.png",
      JpName: "ni",
      EnName: "two",
      sound: "sounds/numbers/number_two_sound.mp3",
      color: Color(0xffEBA21D),
    ),
    Number(
      image: "assets/images/numbers/number_three.png",
      JpName: "san",
      EnName: "three",
      sound: "sounds/numbers/number_three_sound.mp3",
      color: Color(0xffEBA21D),
    ),
    Number(
      image: "assets/images/numbers/number_four.png",
      JpName: "shi",
      EnName: "four",
      sound: "sounds/numbers/number_four_sound.mp3",
      color: Color(0xffEBA21D),
    ),
    Number(
      image: "assets/images/numbers/number_five.png",
      JpName: "go",
      EnName: "five",
      sound: "sounds/numbers/number_five_sound.mp3",
      color: Color(0xffEBA21D),
    ),
    Number(
      image: "assets/images/numbers/number_six.png",
      JpName: "roku",
      EnName: "six",
      sound: "sounds/numbers/number_six_sound.mp3",
      color: Color(0xffEBA21D),
    ),
    Number(
      image: "assets/images/numbers/number_seven.png",
      JpName: "shichi",
      EnName: "seven",
      sound: "sounds/numbers/number_seven_sound.mp3",
      color: Color(0xffEBA21D),
    ),
    Number(
      image: "assets/images/numbers/number_eight.png",
      JpName: "hachi",
      EnName: "eight",
      sound: "sounds/numbers/number_eight_sound.mp3",
      color: Color(0xffEBA21D),
    ),
    Number(
      image: "assets/images/numbers/number_nine.png",
      JpName: "kyuu",
      EnName: "nine",
      sound: "sounds/numbers/number_nine_sound.mp3",
      color: Color(0xffEBA21D),
    ),
    Number(
      image: "assets/images/numbers/number_ten.png",
      JpName: "juu",
      EnName: "ten",
      sound: "sounds/numbers/number_ten_sound.mp3",
      color: Color(0xffEBA21D),
    ),
  ];

  final AudioPlayer audioPlayer = AudioPlayer();
  List<bool> isPlayingList = [];

  @override
  void initState() {
    super.initState();
    isPlayingList = List<bool>.filled(numbers.length, false);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff673AB7),
        title: const Text(
          "Numbers",
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
          itemCount: numbers.length,
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
                  backgroundImage: AssetImage(numbers[index].image!),
                ),
                title: Text(
                  numbers[index].JpName!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  numbers[index].EnName!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      if (isPlayingList[index]) {
                        audioPlayer.pause();
                        isPlayingList[index] = false;
                      } else {
                        audioPlayer.play(AssetSource(numbers[index].sound!));
                        isPlayingList[index] = true;
                      }
                      audioPlayer.onPlayerComplete.listen((event) {
                        setState(() {
                          isPlayingList[index] = false;
                        });
                      });
                    });
                  },
                  icon: Icon(
                    isPlayingList[index] ? Icons.pause : Icons.play_arrow,
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
