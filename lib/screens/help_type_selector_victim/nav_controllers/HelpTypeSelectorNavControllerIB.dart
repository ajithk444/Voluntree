import 'package:call_for_code_2019/resources/themes/ColorsManager.dart';
import 'package:flutter/material.dart';
import './../pages/HelpTypeSelectorVictimPage.dart';

class HelpTypeSelectorNavControllerIB {
  static Widget build() {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: ColorsManager.backgroundGrey,
        elevation: 0.0,
      ),
      body: HelpTypeSelectorVictimPage(),
    );
  }
}
