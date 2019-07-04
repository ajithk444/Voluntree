import 'package:call_for_code_2019/screens/help_type_selector_victim/nav_controllers/HelpTypeSelectorVictimNavController.dart';
import 'package:flutter/material.dart';

import 'VictimDestinationReachedPageIB.dart';

class VictimDestinationReachedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => VictimDestinationReachedPageState();
}

class VictimDestinationReachedPageState extends State<VictimDestinationReachedPage>{
  @override
  Widget build(BuildContext context) => VictimDestinationReachedPageIB.build(onPressed);

  void onPressed() => Navigator.popUntil(context, ModalRoute.withName(HelpTypeSelectorVictimNavController.routeName));
}