import 'package:flutter/material.dart';

class ConfirmationButton extends StatelessWidget {
  String text;
  void Function() onPressed;

  ConfirmationButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: FlatButton(
          padding: EdgeInsets.only(top: 16, bottom: 16, left: 70, right: 70),
          shape: new RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.lightBlue, width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(4)),
          // color: Colors.transparent,
          child: Text(text,
              style: TextStyle(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.w400,
                  fontSize: 16)),
          onPressed: onPressed),
    );
  }
}
