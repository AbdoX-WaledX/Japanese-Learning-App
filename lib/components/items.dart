//import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:toku_learning_app/models/number.dart';

class Items extends StatefulWidget {
  const Items({super.key, required this.number});

  final Number number;

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: widget.number.color,
      child: Row(
        children: [
          Container(
              color: const Color(0xffFFFCE5),
              child: Image.asset(
                widget.number.image!,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SizedBox(
              width: 110,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.number.JpName!,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    widget.number.EnName!,
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: IconButton(
              onPressed: () {
                setState(() {
                  if (isPlaying) {
                    audioPlayer.pause();
                    isPlaying = false;
                  } else {
                    
                    audioPlayer.play(AssetSource(widget.number.sound!));
                    isPlaying = !isPlaying;
                  }
                  audioPlayer.onPlayerComplete.listen((event) {
                   setState(() {
                      isPlaying = false;
                    });
                  });
                  
                });
              },
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
          )
        ],
      ),
    );
  }
}
