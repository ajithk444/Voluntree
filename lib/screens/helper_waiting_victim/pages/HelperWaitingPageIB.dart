import 'package:call_for_code_2019/resources/images/Images.dart';
import 'package:call_for_code_2019/widgets/ConfirmationScreen.dart';
import 'package:flutter/material.dart';

class HelperWaitingPageIB {
  static Widget build() => ConfirmationScreen(
      "We are looking for people you can help",
      "Please, hold on a second",
      Images.transportImageButton,
      null,
      null);
}
