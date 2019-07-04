
import 'package:flutter/material.dart';

import 'HomeNavControllerIB.dart';

class HomeNavController extends StatefulWidget {
  static final String routeName = "HomeNavController";
  @override
  _HomeNavControllerState createState() => _HomeNavControllerState();
}

class _HomeNavControllerState extends State<HomeNavController> {
  @override
  Widget build(BuildContext context) => HomeNavControllerIB.build();
}