import 'package:call_for_code_2019/resources/themes/ColorsManager.dart';
import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final String image;
  final void Function() onTap;
  HomeButton(this.text, this.onTap, this.image);

  final _borderRadius = BorderRadius.circular(11);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
      decoration: BoxDecoration(borderRadius: _borderRadius, color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 6, offset: Offset(0, 7))]),
      width: 393,
      height: 150,
      child: Material(
          color: Colors.transparent,
          child: InkWell(
            highlightColor: ColorsManager.shelterSelectedBlue,
            splashColor: ColorsManager.lightBlue,
            borderRadius: _borderRadius,
            onTap: onTap,
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(image, width: 80, height: 80),
                  Padding(
                    padding: const EdgeInsets.only(left: 38),
                    child: Text(text, style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

