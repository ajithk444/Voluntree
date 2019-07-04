import 'package:call_for_code_2019/screens/victim_route_shelter/nav_controllers/VictimRouteShelterNavController.dart';
import 'package:flutter/material.dart';

import 'SuccessPickedUpPageIB.dart';


class SuccessPickedUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => SuccessPickedUpPageState();
}

class SuccessPickedUpPageState extends State<SuccessPickedUpPage>{
  @override
  Widget build(BuildContext context) => SuccessPickedUpPageIB.build(onPressedButton);

  void onPressedButton() => Navigator.pushNamed(context, VictimRouteShelterNavController.routeName);
}