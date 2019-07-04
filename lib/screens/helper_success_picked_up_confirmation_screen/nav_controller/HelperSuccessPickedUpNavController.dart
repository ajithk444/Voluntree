import 'package:flutter/material.dart';

import 'HelperSuccessPickedUpNavControllerIB.dart';

class HelperSuccessPickedUpNavController extends StatefulWidget{
  static final String routeName = "HelperSuccessPickedUpNavController";
  @override
  State<StatefulWidget> createState() => HelperSuccessPickedUpNavControllerState();
  
}

class HelperSuccessPickedUpNavControllerState extends State<HelperSuccessPickedUpNavController> {
  @override
  Widget build(BuildContext context) =>  HelperSuccessPickedUpNavControllerIB.build();
}