import 'package:flutter/material.dart';

import 'VictimRouteHelperInfoNavControllerIB.dart';

class VictimRouteHelperInfoNavController extends StatefulWidget {
  static final String routeName = "VictimRouteHelperInfoNavController";

  @override
  State<StatefulWidget> createState() => VictimRouteHelperInfoNavControllerState();
}

class VictimRouteHelperInfoNavControllerState extends State<VictimRouteHelperInfoNavController> {
  @override
  Widget build(BuildContext context) {
    return VictimRouteHelperInfoNavControllerIB.build();
  }

}