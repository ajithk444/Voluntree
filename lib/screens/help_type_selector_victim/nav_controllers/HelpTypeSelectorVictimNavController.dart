import 'package:flutter/material.dart';
import './HelpTypeSelectorNavControllerIB.dart';

class HelpTypeSelectorVictimNavController extends StatefulWidget {
  static final String routeName = "HelpTypeSelectorVictimNavController";
  @override
  State<StatefulWidget> createState() => HelpTypeSelectorVictimNavControllerState();
}

class HelpTypeSelectorVictimNavControllerState
    extends State<HelpTypeSelectorVictimNavController> {
  @override
  Widget build(BuildContext context) {
    return HelpTypeSelectorNavControllerIB.build();
  }
}
