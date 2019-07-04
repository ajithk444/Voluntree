import 'package:call_for_code_2019/screens/help_type_selector_helper/nav_controllers/HelpTypeSelectorHelperNavControllerIB.dart';
import 'package:flutter/material.dart';

class HelpTypeSelectorHelperNavController extends StatefulWidget {
  static final String routeName = "HelpTypeSelectorHelperNavController";
  @override
  State<StatefulWidget> createState() => HelpTypeSelectorNavControllerState();
}

class HelpTypeSelectorNavControllerState
    extends State<HelpTypeSelectorHelperNavController> {
  @override
  Widget build(BuildContext context) {
    return HelpTypeSelectorHelperNavControllerIB.build();
  }
}
