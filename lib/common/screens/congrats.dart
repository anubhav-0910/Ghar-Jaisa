// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_s4/features/home/screens/home_screen.dart';

class CongratsPage extends StatelessWidget {
  static const routeName = '/congrats';

  final String text;

  const CongratsPage({
    super.key,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            "",
            style: TextStyle(
                color: Color.fromARGB(200, 50, 53, 51),
                fontWeight: FontWeight.w600,
                fontSize: 19),
          ),
        ),
        toolbarHeight: 55,
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 100),
            const Text(
              'Congrats!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFFfd841f),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 200),
            SizedBox(
              height: 45,
              width: 100,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                },
                style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(
                      Size.fromRadius(20),
                    ),
                    iconSize: MaterialStatePropertyAll(400),
                    backgroundColor: MaterialStatePropertyAll(Colors.orange)),
                child: Text('Next', style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
