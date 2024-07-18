import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class Containers extends StatelessWidget {
  Containers({super.key, this.text, this.color, this.ontap});

  String? text;
  Color? color;
  VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap!();
      },
      child: Container(
        alignment: Alignment.centerLeft,
        height: 70,
        width: double.infinity,
        color: color,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "$text",
            style: const TextStyle(fontSize: 19, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
