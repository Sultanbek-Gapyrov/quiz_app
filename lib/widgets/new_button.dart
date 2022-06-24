import 'package:flutter/material.dart';

class NewButton extends StatelessWidget {
  const NewButton({this.text, this.color, this.pressed});
  final String text;

  final Color color;
  final void Function() pressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: color),
      onPressed: pressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.24,
            vertical: MediaQuery.of(context).size.height * 0.010),
        child: Text(
          text,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
