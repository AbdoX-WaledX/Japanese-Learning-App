import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:toku_learning_app/models/PhraseModel.dart';

class Itemphrase extends StatefulWidget {
  const Itemphrase({super.key, required this.prhase});

  final pharo prhase;

  @override
  State<Itemphrase> createState() => _ItemsState();
}

class _ItemsState extends State<Itemphrase> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 15),
            child: SizedBox(
              width: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    child: Text(
                      widget.prhase.JpName!,
                      style: const TextStyle(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      widget.prhase.EnName!,
                      style: const TextStyle(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150),
            child: IconButton(
              alignment: Alignment.center,
              color: Colors.white,
              onPressed: () {
                setState(() {
                  if (isPlaying) {
                    audioPlayer.pause();
                    isPlaying = false;
                  } else {
                    audioPlayer.play(AssetSource(widget.prhase.sound!));
                    isPlaying = true;
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
