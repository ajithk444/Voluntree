import 'package:call_for_code_2019/screens/success_picked_up_confirmation_screen/nav_controller/SuccessPickedUpNavControllerIB.dart';
import 'package:flutter/material.dart';

class SuccessPickedUpNavController extends StatefulWidget{
  static final String routeName = "SuccessPickedUpNavController";
  @override
  State<StatefulWidget> createState() => SuccessPickedUpNavControllerState();
  
}

class SuccessPickedUpNavControllerState extends State<SuccessPickedUpNavController> {
  @override
  Widget build(BuildContext context) =>  SuccessPickedUpNavControllerIB.build();
}