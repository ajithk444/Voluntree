import 'package:call_for_code_2019/widgets/ConfirmationButton.dart';
import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  String title;
  String image;
  String subtitle;
  String textButton;
  void Function() onPressed;

  ConfirmationScreen(
      this.title, this.subtitle, this.image, this.textButton, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Image.asset(image, width: 230, height: 230),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              textButton == null || textButton.isEmpty ? Container(width: 0.0, height: 68.0,) : ConfirmationButton(textButton, onPressed)
            ],
          ),
        ),
      ),
    );
  }
}
