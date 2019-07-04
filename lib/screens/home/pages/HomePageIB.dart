import 'package:call_for_code_2019/resources/images/Images.dart';
import 'package:call_for_code_2019/resources/themes/ColorsManager.dart';
import 'package:call_for_code_2019/widgets/HomeButton.dart';
import 'package:flutter/material.dart';

class HomePageIB {
  static Widget build(
      {BuildContext context,
        void Function() onTappedNeedHelpButton,
        void Function() onTappedWantHelpButton}) =>
      Container(
        color: ColorsManager.backgroundGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 24, bottom: 20),
                  child: Text(
                    "Hello,\nWhat do you want?",
                    style: Theme.of(context).textTheme.body2,
                  ),
                )
              ],
            ),
            HomeButton("I need help", onTappedNeedHelpButton, Images.victimImageButton),
            HomeButton("I want to help", onTappedWantHelpButton, Images.helperImageButton)
          ],
        ),
      );
}
