import 'package:flutter/material.dart';

import 'HelperReachedDestinationNavControllerIB.dart';

class HelperReachedDestinationNavController extends StatefulWidget{
  static final String routeName = "HelperReachedDestinationNavController";
  @override
  State<StatefulWidget> createState() => HelperReachedDestinationNavControllerState();
  
}

class HelperReachedDestinationNavControllerState extends State<HelperReachedDestinationNavController> {
  @override
  Widget build(BuildContext context) =>  HelperReachedDestinationNavControllerIB.build();
}