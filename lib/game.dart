import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<String> drawXO = [" ", " ", " ", " ", " ", " ", " ", " ", " "];
  bool xThTerm = true;
  //var colorX = const TextStyle(color: Colors.white, fontSize: 30);
  //var colorY = const TextStyle(color: Colors.red, fontSize: 30);
  int winX = 0;
  int winY = 0;
  int tappedTimes = 0;

  //google fonts
  var colorX = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.white, fontSize: 15));
  var colorY = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.red, fontSize: 15));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 19, 54),
      body: Column(
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Player X",
                      style: colorX,
                    ),
                    Text(
                      "Score -> $winX",
                      style: colorX,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Player O",
                      style: colorY,
                    ),
                    Text(
                      "Score -> $winY",
                      style: colorY,
                    ),
                  ],
                ),
              ),
            ],
          )),
          Expanded(
            flex: 3,
            child: GridView.builder(
                //make the grid responsive for website
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      tappeD(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 90, 54, 138))),
                      child: Center(
                        child: Text(
                          drawXO[index],
                          style: colorX,
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              child: Center(
            child: Column(
              children: [
                Text(
                  "Player vs Player",
                  style: colorX,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Turn of player ${xThTerm ? "X" : "O"}",
                  style: colorX,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "By Luc1d aka Mahbub",
                  style: GoogleFonts.pressStart2p(
                      textStyle: const TextStyle(
                          color: Color.fromARGB(255, 224, 118, 48),
                          fontSize: 5)),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  void tappeD(int index) {
    setState(() {
      if (xThTerm && drawXO[index] == " ") {
        tappedTimes++;
        drawXO[index] = "X";
        xThTerm = !xThTerm;
      } else if (!xThTerm && drawXO[index] == " ") {
        tappedTimes++;
        drawXO[index] = "O";
        xThTerm = true;
      }
      checkWinner();
    });
  }

  void checkWinner() {
    // check rows 1
    if (drawXO[0] == drawXO[1] && drawXO[0] == drawXO[2] && drawXO[0] != " ") {
      return showWinner(drawXO[0]);
    }
    // check rows 2
    if (drawXO[3] == drawXO[4] && drawXO[3] == drawXO[5] && drawXO[3] != " ") {
      return showWinner(drawXO[3]);
    }
    // check rows 3
    if (drawXO[6] == drawXO[7] && drawXO[6] == drawXO[8] && drawXO[6] != " ") {
      return showWinner(drawXO[6]);
    }
    // check columns 1
    if (drawXO[0] == drawXO[3] && drawXO[0] == drawXO[6] && drawXO[0] != " ") {
      return showWinner(drawXO[0]);
    }
    // check columns 2
    if (drawXO[1] == drawXO[4] && drawXO[1] == drawXO[7] && drawXO[1] != " ") {
      return showWinner(drawXO[1]);
    }
    // check columns 3
    if (drawXO[2] == drawXO[5] && drawXO[2] == drawXO[8] && drawXO[2] != " ") {
      return showWinner(drawXO[2]);
    }
    // check diagonal 1
    if (drawXO[0] == drawXO[4] && drawXO[0] == drawXO[8] && drawXO[0] != " ") {
      return showWinner(drawXO[0]);
    }
    // check diagonal 2
    if (drawXO[2] == drawXO[4] && drawXO[2] == drawXO[6] && drawXO[2] != " ") {
      return showWinner(drawXO[2]);
    }
    if (tappedTimes == 9) {
      return showDraw();
    }

    //
  }

  void showWinner(String win) {
    showDialog(
        barrierDismissible: false,
        barrierColor: Colors.lightBlue.withOpacity(0.5),
        context: context,
        builder: (_) => AlertDialog(
              title: Text("The winner is $win",
                  style: GoogleFonts.pressStart2p(
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 12))),
              actions: [
                TextButton(
                    onPressed: () {
                      clearBoard();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Play Aigain!",
                      style: GoogleFonts.pressStart2p(
                          textStyle: const TextStyle(
                              color: Colors.black, fontSize: 12)),
                    ))
              ],
            ));
    if (win == "X") {
      winX++;
    } else {
      winY++;
    }
  }

  void showDraw() {
    showDialog(
        barrierDismissible: false,
        barrierColor: Colors.lightBlue.withOpacity(0.5),
        context: context,
        builder: (_) => AlertDialog(
              title: Text(
                "It's a draw!",
                style: GoogleFonts.pressStart2p(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 12)),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      clearBoard();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Play Aigain!",
                      style: GoogleFonts.pressStart2p(
                          textStyle: const TextStyle(
                              color: Colors.black, fontSize: 12)),
                    ))
              ],
            ));
  }

  void clearBoard() {
    setState(() {
      tappedTimes = 0;
      drawXO = [" ", " ", " ", " ", " ", " ", " ", " ", " "];
    });
  }
}
