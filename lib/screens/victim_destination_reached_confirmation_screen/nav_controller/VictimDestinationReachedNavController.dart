import 'package:flutter/material.dart';

import 'VictimDestinationReachedNavControllerIB.dart';

class VictimDestinationReachedNavController extends StatefulWidget{
  static final routeName = "VictimDestinationReachedNavController";
  @override
  State<StatefulWidget> createState() => VictimDestinationReachedNavControllerState();
  
}

class VictimDestinationReachedNavControllerState extends State<VictimDestinationReachedNavController> {
  @override
  Widget build(BuildContext context) =>  VictimDestinationReachedNavControllerIB.build();
}