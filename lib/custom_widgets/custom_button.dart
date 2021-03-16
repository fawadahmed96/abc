import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPress;
  final Color buttonColor;
  final Color textColor;
  final String text;
  final double fontSize;
  final bool flag;
  CustomButton(
      {this.onPress,
      this.buttonColor,
      this.textColor = Colors.white,
      this.text,
      this.fontSize = 20.0,
      this.flag = false});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        text,
      ),
      textColor: flag == true ? textColor : textColor,
      color: buttonColor,
      onPressed: onPress,
    );
  }
}
