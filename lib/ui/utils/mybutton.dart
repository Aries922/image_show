import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  Function press;
  String texts;
  MyButton({@required this.press, this.texts});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(onPressed: press, child: Text("$texts")),
    );
  }
}