import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:toku_learning_app/models/number.dart';

class FamilyMembers extends StatefulWidget {
  @override
  _FamilyMembersState createState() => _FamilyMembersState();
}

class _FamilyMembersState extends State<FamilyMembers> {
  final List<Number> family = [
    Number(
      image: "assets/images/family_members/family_father.png",
      EnName: "father",
      JpName: "Chichioya",
      sound: "sounds/family_members/father.wav",
      color: Color(0xff548635),
    ),
    Number(
      image: "assets/images/family_members/family_mother.png",
      EnName: "mother",
      JpName: "Okāsama",
      sound: "sounds/family_members/mother.wav",
      color: Color(0xff548635),
    ),
    Number(
      image: "assets/images/family_members/family_daughter.png",
      EnName: "daughter",
      JpName: "Musume",
      sound: "sounds/family_members/daughter.wav",
      color: Color(0xff548635),
    ),
    Number(
      image: "assets/images/family_members/family_older_brother.png",
      EnName: "older brother",
      JpName: "Oniichan",
      sound: "sounds/family_members/older bother.wav",
      color: Color(0xff548635),
    ),
    Number(
      image: "assets/images/family_members/family_older_sister.png",
      EnName: "older sister",
      JpName: "Oneechan",
      sound: "sounds/family_members/older sister.wav",
      color: Color(0xff548635),
    ),
    Number(
      image: "assets/images/family_members/family_son.png",
      EnName: "son",
      JpName: "Musuko",
      sound: "sounds/family_members/son.wav",
      color: Color(0xff548635),
    ),
    Number(
      image: "assets/images/family_members/family_younger_sister.png",
      EnName: "younger sister",
      JpName: "Imōto-san",
      sound: "sounds/family_members/younger sister.wav",
      color: Color(0xff548635),
    ),
    Number(
      image: "assets/images/family_members/family_younger_brother.png",
      EnName: "younger brother",
      JpName: "Otōto-san",
      sound: "sounds/family_members/younger brohter.wav",
      color: Color(0xff548635),
    ),
    Number(
      image: "assets/images/family_members/family_grandfather.png",
      EnName: "grandfather",
      JpName: "Ojiisama",
      sound: "sounds/family_members/grand father.wav",
      color: Color(0xff548635),
    ),
    Number(
      image: "assets/images/family_members/family_grandmother.png",
      EnName: "grandmother",
      JpName: "Obāsama",
      sound: "sounds/family_members/grand mother.wav",
      color: Color(0xff548635),
    ),
  ];

  final AudioPlayer audioPlayer = AudioPlayer();
  List<bool> isPlayingList = [];

  @override
  void initState() {
    super.initState();
    isPlayingList = List<bool>.filled(family.length, false);
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
        backgroundColor: Color(0xff673AB7),
        title: Text(
          "Family Members",
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
          itemCount: family.length,
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
                  backgroundImage: AssetImage(family[index].image!),
                ),
                title: Text(
                  family[index].JpName!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  family[index].EnName!,
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
                        audioPlayer.play(AssetSource(family[index].sound!));
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
