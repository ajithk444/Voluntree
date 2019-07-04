import 'package:call_for_code_2019/screens/victim_confirmation_screen/nav_controller/VictimConfirmationNavControllerIB.dart';
import 'package:flutter/material.dart';

class VictimConfirmationNavController extends StatefulWidget{
  static final routeName = "VictimConfirmationNavController";
  @override
  State<StatefulWidget> createState() => VictimConfirmationNavControllerState();
  
}

class VictimConfirmationNavControllerState extends State<VictimConfirmationNavController> {
  @override
  Widget build(BuildContext context) =>  VictimConfirmationNavControllerIB.build();
}