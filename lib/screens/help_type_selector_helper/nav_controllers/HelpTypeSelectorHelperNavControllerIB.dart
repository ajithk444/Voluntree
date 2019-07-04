import 'package:call_for_code_2019/resources/themes/ColorsManager.dart';
import 'package:call_for_code_2019/screens/help_type_selector_helper/pages/HelpTypeSelectorHelperPage.dart';
import 'package:flutter/material.dart';

class HelpTypeSelectorHelperNavControllerIB {
  static Widget build() {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: ColorsManager.backgroundGrey,
        elevation: 0.0,
      ),
      body: HelpTypeSelectorHelperPage(),
    );
  }
}
