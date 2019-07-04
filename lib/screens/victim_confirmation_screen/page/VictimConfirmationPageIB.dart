import 'package:call_for_code_2019/resources/images/Images.dart';
import 'package:call_for_code_2019/widgets/ConfirmationButton.dart';
import 'package:call_for_code_2019/widgets/ConfirmationScreen.dart';
import 'package:flutter/material.dart';

abstract class VictimConfirmationPageIB {
  static Widget build(void Function() onPressed) {
    return ConfirmationScreen(
        "",
        "We’ll let you know when\nsomeone is ready to help you",
        Images.bellConfirmationImage,
        "",
        onPressed);
  }
}
