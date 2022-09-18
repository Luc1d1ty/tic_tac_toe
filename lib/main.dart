import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:google_fonts/google_fonts.dart';

import 'game.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.black, letterSpacing: 3));
  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.red, letterSpacing: 3));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.grey[900],
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120.0),
                    child: Text(
                      "TIC TAC TOE",
                      style: myNewFontWhite.copyWith(fontSize: 30),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: AvatarGlow(
                    endRadius: 140,
                    duration: const Duration(seconds: 2),
                    glowColor: Colors.lightBlue,
                    repeat: true,
                    repeatPauseDuration: const Duration(seconds: 1),
                    startDelay: const Duration(seconds: 1),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.none,
                          ),
                          shape: BoxShape.circle),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[900],
                        radius: 80.0,
                        child: Image.asset(
                          'lib/img/1.png',
                          color: Colors.yellow,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Text(
                      "@Luc1d",
                      style: myNewFontWhite.copyWith(fontSize: 20),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, bottom: 60),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            'PLAY GAME',
                            style: myNewFont,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
