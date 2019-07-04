import 'package:call_for_code_2019/resources/images/Images.dart';
import 'package:call_for_code_2019/widgets/ConfirmationButton.dart';
import 'package:call_for_code_2019/widgets/ConfirmationScreen.dart';
import 'package:flutter/material.dart';

abstract class HelperSuccessPickedUpPageIB {
  static Widget build(void Function() onPressed) {
    return ConfirmationScreen("Fantastic", "You are with John now",
        Images.successPickedUpImage, "GO TO NAVIGATION", onPressed);
  }
}
