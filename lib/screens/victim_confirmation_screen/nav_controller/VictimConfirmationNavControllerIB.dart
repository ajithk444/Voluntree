import 'package:call_for_code_2019/screens/victim_confirmation_screen/page/VictimConfirmationPage.dart';
import 'package:flutter/material.dart';

abstract class VictimConfirmationNavControllerIB {
  static Widget build() {
    return Scaffold(
      body: VictimConfirmationPage(),
    );
  }
}
