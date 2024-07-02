import 'package:flutter/material.dart';
import 'package:xogame/ButtonClick.dart';
import 'package:xogame/LoginScreen.dart';
import 'package:xogame/PlayersData.dart';

class GameScreen extends StatefulWidget {
  static const String routeName = 'game';

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> buttonText = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  List<Color> colors = [
    Colors.indigoAccent,
    Colors.indigoAccent,
    Colors.indigoAccent,
    Colors.indigoAccent,
    Colors.indigoAccent,
    Colors.indigoAccent,
    Colors.indigoAccent,
    Colors.indigoAccent,
    Colors.indigoAccent,
  ];
  int xscore = 0;
  int oscore = 0;

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as PlayersData;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(
          'Game Screen',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          data.player1name + ' (X)',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text('score=$xscore')
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          data.Player2name + ' (O)',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text('score=$oscore')
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: GridView(
              padding: EdgeInsets.all(5),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1.33,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2),
              children: [
                ButtonClick(
                  text: buttonText[0],
                  index: 0,
                  onClick: onClick,
                  color: colors[0],
                ),
                ButtonClick(
                  text: buttonText[1],
                  index: 1,
                  onClick: onClick,
                  color: colors[1],
                ),
                ButtonClick(
                  text: buttonText[2],
                  index: 2,
                  onClick: onClick,
                  color: colors[2],
                ),
                ButtonClick(
                  text: buttonText[3],
                  index: 3,
                  onClick: onClick,
                  color: colors[3],
                ),
                ButtonClick(
                  text: buttonText[4],
                  index: 4,
                  onClick: onClick,
                  color: colors[4],
                ),
                ButtonClick(
                  text: buttonText[5],
                  index: 5,
                  onClick: onClick,
                  color: colors[5],
                ),
                ButtonClick(
                  text: buttonText[6],
                  index: 6,
                  onClick: onClick,
                  color: colors[6],
                ),
                ButtonClick(
                  text: buttonText[7],
                  index: 7,
                  onClick: onClick,
                  color: colors[7],
                ),
                ButtonClick(
                  text: buttonText[8],
                  index: 8,
                  onClick: onClick,
                  color: colors[8],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  int count = 0;

  void onClick(int index) {
    if (buttonText[index].isEmpty) {
      if (count % 2 == 0) {
        buttonText[index] = 'X';
        colors[index] = Colors.orange;
      } else {
        buttonText[index] = 'O';
        colors[index] = Colors.red;
      }
      count++;
    }

    if (checkWin('X')) {
      xscore += 1;
      count = 0;
      init();
      _showDialog(context, 'X', 'congratulation you win it ');
    }
    if (checkWin('O')) {
      oscore += 1;
      count = 0;
      init();
      _showDialog(context, 'O', 'congratulation you win it ');
    }

    if (count == 9) {
      init();
      count = 0;
      _showDialog(context, 'draw', "Press to start again");
    }

    setState(() {});
  }

  bool checkWin(String input) {
    //rows
    for (int i = 0; i < 8; i += 3) {
      if (buttonText[i] == input &&
          buttonText[i + 1] == input &&
          buttonText[i + 2] == input) {
        init();
        return true;
      }
    }
    //column
    for (int i = 0; i < 3; i++) {
      if (buttonText[i] == input &&
          buttonText[i + 3] == input &&
          buttonText[i + 6] == input) {
        init();
        return true;
      }
    }
    if (buttonText[0] == input &&
        buttonText[4] == input &&
        buttonText[8] == input) {
      init();

      return true;
    }
    if (buttonText[2] == input &&
        buttonText[4] == input &&
        buttonText[6] == input) {
      init();

      return true;
    }
    return false;
  }

  void init() {
    buttonText = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
    colors = [
      Colors.indigoAccent,
      Colors.indigoAccent,
      Colors.indigoAccent,
      Colors.indigoAccent,
      Colors.indigoAccent,
      Colors.indigoAccent,
      Colors.indigoAccent,
      Colors.indigoAccent,
      Colors.indigoAccent,
    ];
  }

  _showDialog(BuildContext context, String winner, String content) {
    var data = ModalRoute.of(context)!.settings.arguments as PlayersData;
    if (winner == 'X') {
      winner = data.player1name;
    } else if (winner == 'O') {
      winner = data.Player2name;
    } else {
      winner = 'draw';
    }

    AlertDialog alert =
        AlertDialog(title: Text(winner), content: Text(content), actions: [
      Row(
        children: [
          TextButton(
            child: Text('Contiune'),
            onPressed: () {
              init();
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Exit'),
            onPressed: () {
              init();
              Navigator.of(context).popUntil(
                ModalRoute.withName(LoginScreen.routeName),
              );
            },
          ),
        ],
      )
    ]);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
