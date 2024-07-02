import 'package:flutter/material.dart';

class ButtonClick extends StatelessWidget {
  String text;
  int index;
  Function onClick;
  Color color;

  ButtonClick(
      {required this.text,
      required this.index,
      required this.onClick,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onClick(index);
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 100),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
    );
  }
}
