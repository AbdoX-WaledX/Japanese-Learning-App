import 'package:flutter/material.dart';
import 'package:toku_learning_app/screens/FamilyMembers_page.dart';
import 'package:toku_learning_app/screens/Numbers_page.dart';
import 'package:toku_learning_app/screens/Phrase_page.dart';
import 'package:toku_learning_app/screens/colors_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: AppBar(
        title: const Text(
          "Toku",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff673AB7),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            buildMenuItem(
              context: context,
              text: "Numbers",
              color: const Color(0xffFA9532),
              icon: Icons.looks_one,
              page: NumbersPage(),
            ),
            const SizedBox(height: 15),
            buildMenuItem(
              context: context,
              text: "Family Members",
              color: const Color(0xff538033),
              icon: Icons.family_restroom,
              page: FamilyMembers(),
            ),
            const SizedBox(height: 15),
            buildMenuItem(
              context: context,
              text: "Colors",
              color: const Color(0xff7E3FA3),
              icon: Icons.color_lens,
              page: Colours(),
            ),
            const SizedBox(height: 15),
            buildMenuItem(
              context: context,
              text: "Phrases",
              color: const Color(0xff48A5CC),
              icon: Icons.chat,
              page: PhrasePage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required BuildContext context,
    required String text,
    required Color color,
    required IconData icon,
    required Widget page,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 20),
            Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(width: 20),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
