import 'package:flutter/material.dart';
import 'package:xogame/PlayersData.dart';
import 'package:xogame/gamescreen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    TextEditingController player1 = TextEditingController();
    TextEditingController player2 = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(
          'Login Screen ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 100),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(60), topLeft: Radius.circular(60)),
        ),
        child: Column(
          children: [
            Text(
              'Login',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: player1,
                    decoration: InputDecoration(
                        labelText: 'Enter Player 1 name',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: player2,
                    decoration: InputDecoration(
                        labelText: 'Enter Player 2 name',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (player1.text.isNotEmpty &&
                            player2.text.isNotEmpty) {
                          Navigator.of(context).pushNamed(GameScreen.routeName,
                              arguments: PlayersData(
                                  player1name: player1.text.trim(),
                                  Player2name: player2.text.trim()));
                          player1.clear();
                          player2.clear();
                        }
                      },
                      child: Text(
                        'Start Game',
                        style: TextStyle(color: Colors.indigoAccent),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
