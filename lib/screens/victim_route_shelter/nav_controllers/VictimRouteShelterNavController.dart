import 'package:flutter/material.dart';
import 'VictimRouteShelterNavControllerIB.dart';

class VictimRouteShelterNavController extends StatefulWidget {
  static final String routeName = "VictimRouteShelterNavController";

  @override
  State<StatefulWidget> createState() => VictimRouteShelterNavControllerState();
}

class VictimRouteShelterNavControllerState extends State<VictimRouteShelterNavController> {
  @override
  Widget build(BuildContext context) {
    return VictimRouteShelterNavControllerIB.build();
  }
}