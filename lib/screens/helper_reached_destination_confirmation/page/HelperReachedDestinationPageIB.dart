import 'package:call_for_code_2019/resources/images/Images.dart';
import 'package:call_for_code_2019/widgets/ConfirmationButton.dart';
import 'package:call_for_code_2019/widgets/ConfirmationScreen.dart';
import 'package:flutter/material.dart';

abstract class HelperReachedDestinationPageIB {
  static Widget build(void Function() onPressed) {
    return ConfirmationScreen(
        "You have reached your destination",
        "Wait for John to confirm \nyou have picked him up",
        Images.confirmationImage,
        "CALL JOHN",
        onPressed);
  }
}
