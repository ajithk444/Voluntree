import 'package:call_for_code_2019/resources/images/Images.dart';
import 'package:call_for_code_2019/widgets/ConfirmationScreen.dart';
import 'package:flutter/material.dart';

abstract class HelperConfirmationVictimIsSafePageIB {
  static Widget build(void Function() onPressed) {
    return ConfirmationScreen("John is safe", "Thank you for helping",
        Images.victimSavedImage, "HELP SOMEONE ELSE", onPressed);
  }
}
