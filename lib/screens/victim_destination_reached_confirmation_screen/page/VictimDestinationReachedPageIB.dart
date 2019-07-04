import 'package:call_for_code_2019/resources/images/Images.dart';
import 'package:call_for_code_2019/widgets/ConfirmationButton.dart';
import 'package:call_for_code_2019/widgets/ConfirmationScreen.dart';
import 'package:flutter/material.dart';

abstract class VictimDestinationReachedPageIB {
  static Widget build(void Function() onPressed) {
    return ConfirmationScreen("You are safe", "Need anything else?",
        Images.victimSavedImage, "BACK TO MENU", onPressed);
  }
}
