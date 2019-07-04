import 'package:call_for_code_2019/data/ui/VictimInfoUI.dart';
import 'package:call_for_code_2019/screens/map/navcontrollers/HelperMapArguments.dart';
import 'package:call_for_code_2019/screens/map/navcontrollers/HelperMapNavController.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'HelperWaitingNavControllerIB.dart';

class HelperWaitingNavController extends StatefulWidget {
  static final String routeName = "HelperWaitingNavController";

  @override
  _HelperWaitingNavControllerState createState() =>
      _HelperWaitingNavControllerState();
}

class _HelperWaitingNavControllerState
    extends State<HelperWaitingNavController> {
  void onContinue() {
    Navigator.of(context).pushNamed(
        HelperMapNavController.routeName,
        arguments: HelperMapArguments([
          VictimInfoUI("John", "Smith", DateTime.now(), "678838383", 2,
              "My wife and me", LatLng(0, 0), "", null),
          VictimInfoUI("Luis", "Armstrong", DateTime.now(), "675434343", 1,
              "Just me, no luggage", LatLng(0, 0), "", null)
        ])
    );
  }

  @override
  Widget build(BuildContext context) =>
      HelperWaitingNavControllerIB.build(onContinue);
}
