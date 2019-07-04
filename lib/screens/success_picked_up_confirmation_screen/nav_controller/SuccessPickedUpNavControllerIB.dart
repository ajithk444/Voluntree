import 'package:call_for_code_2019/screens/success_picked_up_confirmation_screen/page/SuccessPickedUpPage.dart';
import 'package:flutter/material.dart';

abstract class SuccessPickedUpNavControllerIB {
  static Widget build() {
    return Scaffold(
      body: SuccessPickedUpPage(),
    );
  }
}
